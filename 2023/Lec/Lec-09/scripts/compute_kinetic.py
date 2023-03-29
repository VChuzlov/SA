import numpy as np
from scipy.optimize import minimize, differential_evolution
from flows import Flow
from reactors import Reactor
from mixer import Mixer
from kinetic import kinetic_scheme
import constants as const
import converters_and_functions as conv


data = np.array(
    [
        0.0073, 0.2374,  .0,    .0, 0.0103, 0.2064, 0.031,  .0,
        0.1032, 0.1961, 0.1239, .0, 0.0062, 0.0361, 0.0206, .0, 0.0215,
    ]
)


def obj_func(
    predexp, feedstock, reactor, kinetic_scheme, data) -> float:
    product = reactor.calculate(kinetic_scheme, feedstock, predexp=predexp)
    return ((data - product.mass_fractions) ** 2).sum()


def main() -> None:
    mf = np.array(
        [
            0.1784, 0.0557, 0.0223, 0., 0.0948, 0.1171, 0.0446,
            0.0056, 0.1587, 0.146,  0.1066, 0.0168, 0.0123,
            0.0293, 0.0118, 0., 0.,
        ]
    )
    f = Flow(
        50_000,
        mf, 
        temperature=403.15,
        pressure=3001.325
    )
    h2_mf = np.zeros_like(mf)
    h2_mf[3] = 1.
    h2 = Flow(
        mass_flow_rate=80, 
        mass_fractions=h2_mf, 
        temperature=403.15, 
        pressure=3001.325
    )
    mxr = Mixer()
    feedstock = mxr.mix(f, h2)    
    r = Reactor(*const.bed_params)
    x0 = const.PREDEXP
    # x0 = np.random.random(44)
    solution = minimize(
        obj_func,
        x0,
        args=(feedstock, r, kinetic_scheme, data),
        method='Nelder-Mead',
        bounds=[(0, None) for _ in range(44)]
    )
    print(solution.fun)
    print(solution.x)
    return


if __name__ == '__main__':
    main()
