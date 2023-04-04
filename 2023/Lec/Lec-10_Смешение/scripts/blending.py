import numpy as np
from scipy.optimize import minimize
import constants as const
from flows import Flow
from mixer import Mixer
import genetic_algorithm as ga


def get_octane_nummber(
        flow: Flow,
        ron: np.ndarray = const.RON,
        bi: np.ndarray = const.Bi
    ) -> float:
    mf = flow.mass_fractions
    additive = (ron * mf).sum()
    
    non_additive = 0
    for i, _ in enumerate(mf):
        for j in range(i+1, mf.shape[0]):
            non_additive += bi[i] * bi[j] * mf[i] * mf[j]
    
    return additive + non_additive


class Blending:
    def blend(self, *flows: Flow) -> Flow:
        """Смешение потоков"""
        m = Mixer()
        mixture = m.mix(*flows)
        mixture.ron = get_octane_nummber(mixture)
        return mixture

    def calculate_ratio(self, expected_value: float, *flows: Flow) -> dict:
        """Расчет оптимального соотношения потоков"""
        def obj_func(x: np.ndarray, value: float) -> float:
            m = Mixer()
            flows_ = flows[:]
            [
                flow.mass_flow_rate * x[i] for i, flow in enumerate(flows_)
            ]
            mixture = m.mix(*flows_)
            mixture.ron = get_octane_nummber(mixture)
            return abs(value - mixture.ron)
        
        x0 = np.random.random(len(flows))
        x0 = x0 / x0.sum()
        constr = {
            'type': 'eq',
            'fun': lambda x: 1 - x.sum()
        }
        res = minimize(
            obj_func, 
            x0,
            args=(expected_value, ),
            # constraints=constr,
            method='Nelder-Mead'
        )
        res = ga.genetic_algorithm(
            ((0, .15), (0, .15), (0, .15), (0, .15), (0, .15), (0, .5),),
            obj_func,
            args=(expected_value, ),
            popsize=100,
            selection_size=20,
            generations_count=10
        )
        return res


if __name__ == '__main__':
    data = np.loadtxt('data.txt')
    t = 273.15
    p = 101.325
    g = 100
    flows = [
        Flow(
            mass_flow_rate=g, 
            mass_fractions=mf, 
            temperature=t, 
            pressure=p
        )
        for mf in data.T
    ]
    blending = Blending()
    mixture = blending.blend(flows[-1])
    print(mixture.ron)
    res = blending.calculate_ratio(90, *flows)
    print(res[0])
    [flow.mass_flow_rate * res[i] for i, flow in enumerate(flows)]
    mixture = blending.blend(*flows)
    print(mixture.ron)
    print()