import numpy as np
import pandas as pd
import constants as const
from kinetic import kinetic_scheme
from flows import Flow
from mixer import Mixer
from reactors import Reactor


def calculation(t: float) -> tuple[float, float]:
    mf = np.array(
        [
            0.1784, 0.0557, 0.0223, 0., 0.0948, 0.1171, 0.0446,
            0.0056, 0.1587, 0.146, 0.1066, 0.0168, 0.0123,
            0.0293, 0.0118, 0., 0.,
        ]
    )
    f = Flow(
        50_000,
        mf,
        temperature=t,
        pressure=3001.325
    )
    h2_mf = np.zeros_like(mf)
    h2_mf[3] = 1.
    h2 = Flow(
        mass_flow_rate=80,
        mass_fractions=h2_mf,
        temperature=t,
        pressure=3001.325
    )
    mxr = Mixer()
    feedstock = mxr.mix(f, h2)
    r = Reactor(*const.bed_params)
    r.calculate(kinetic_scheme, feedstock, predexp=const.PREDEXP)
    perf = r.performance()
    isomerate_yield = perf['Выход изомеризата, % масс.']
    isoalkanes_yield = perf['Выход изоалканов, % масс.']
    return isomerate_yield, isoalkanes_yield


def main() -> None:
    t = np.linspace(350, 500, 20)
    vcalculation = np.vectorize(calculation)
    isomerate, isoalkanes = vcalculation(t)
    print('Температура, К',
          'Выход изомеризата, % масс.', 'Выход изоалканов, % масс.')
    for ti, isom, isoalk in zip(t, isomerate, isoalkanes):
        print(f'{ti:>14.2f} {isom:>26.2f} {isoalk:>25.2f}')
    results = pd.DataFrame(
        {
            'Температура, К': t,
            'Выход изомеризата, % масс.': isomerate,
            'Выход изоалканов, % масс.': isoalkanes
        }
    )
    results.to_excel('results.xlsx', index=False)


if __name__ == '__main__':
    main()
