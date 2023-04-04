import numpy as np
from scipy.optimize import minimize
import constants as const
from flows import Flow
from mixer import Mixer


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
            [
                flow.mass_flow_rate * x[i] for i, flow in enumerate(flows)
            ]
            mixture = m.mix(*flows)
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
            constraints=constr,
            # bounds=((0, .1), (0, .1), (0, .1), (0, .1), (0, .1), (0, 1),),
            method='slsqp'
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
    res = blending.calculate_ratio(75, *flows)
    print(res)
    print(res.x.sum())