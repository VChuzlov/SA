import numpy as np
from flows import Flow
from heat_exchanger import HeatExchanger
from mixer import Mixer
from splitter import Splitter
import matplotlib.pyplot as plt


def main() -> None:
    mf1 = np.array(
        [
            0.0000,	0.0000,	0.0975,	0.0000,	0.0010,	0.0098,	0.0098,	0.0010,	
            0.0000,	0.1463,	0.0000,	0.1463,	0.0010,	0.0000,	0.0010,	0.0001,	
            0.0001,	0.0000,	0.1951,	0.0488,	0.0000,	0.2926,	0.0010,	0.0488,
        ]
    )
    mf8 = np.array(
        [
            0,	0,	0,	0,	0.0009,	0.0093,	0.0093,	0.0009,	0,	0.465,	0,	
            0.2325,	0.0009,	0,	0.0009,	0.0001,	0.0001,	0,	0,	0.2325,	0,	
            0,	0.0009,	0.0465,
        ]
    )
    flow1 = Flow(
        mass_flow_rate=1159,
        mass_fractions=mf1,
        temperature=300
    )
    
    splitter1 = Splitter()
    flow2, flow3, flow4 = splitter1.calculate(
        flow1, .3333, .3333, .3334
    )

    flow8 = Flow(
        mass_flow_rate=3000,
        mass_fractions=mf8,
        temperature=500
    )
    splitter2 = Splitter()
    flow9, flow10, flow11 = splitter2.calculate(
        flow8, .3333, .3333, .3334
    )

    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow12, flow5 = he1.calculate(
        hot=flow9,
        cold=flow2
    )
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow14, flow6 = he2.calculate(
        hot=flow11,
        cold=flow3
    )
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow13, flow7 = he3.calculate(
        hot=flow10,
        cold=flow4
    )

    mixer1 = Mixer()
    flow15 = mixer1.mix(flow12, flow13, flow14)

    mixer2 = Mixer()
    flow16 = mixer2.mix(flow5, flow6, flow7)

    print('====Flow15====')
    print(f'Массовый расход: {flow15.mass_flow_rate:>8.2f}')
    print(f'Температура: {flow15.temperature:>8.2f}')
    print(f'Состав {flow15.mass_fractions}')

    print('====Flow16====')
    print(f'Массовый расход: {flow16.mass_flow_rate:>8.2f}')
    print(f'Температура: {flow16.temperature:>8.2f}')
    print(f'Состав {flow16.mass_fractions}')

    return


def case_study(temperature: float) -> float:
    mf1 = np.array(
        [
            0.0000,	0.0000,	0.0975,	0.0000,	0.0010,	0.0098,	0.0098,	0.0010,	
            0.0000,	0.1463,	0.0000,	0.1463,	0.0010,	0.0000,	0.0010,	0.0001,	
            0.0001,	0.0000,	0.1951,	0.0488,	0.0000,	0.2926,	0.0010,	0.0488,
        ]
    )
    mf8 = np.array(
        [
            0,	0,	0,	0,	0.0009,	0.0093,	0.0093,	0.0009,	0,	0.465,	0,	
            0.2325,	0.0009,	0,	0.0009,	0.0001,	0.0001,	0,	0,	0.2325,	0,	
            0,	0.0009,	0.0465,
        ]
    )
    flow1 = Flow(
        mass_flow_rate=1159,
        mass_fractions=mf1,
        temperature=temperature
    )
    
    splitter1 = Splitter()
    flow2, flow3, flow4 = splitter1.calculate(
        flow1, .3333, .3333, .3334
    )

    flow8 = Flow(
        mass_flow_rate=3000,
        mass_fractions=mf8,
        temperature=500
    )
    splitter2 = Splitter()
    flow9, flow10, flow11 = splitter2.calculate(
        flow8, .3333, .3333, .3334
    )

    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    _, flow5 = he1.calculate(
        hot=flow9,
        cold=flow2
    )
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    _, flow6 = he2.calculate(
        hot=flow11,
        cold=flow3
    )
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    _, flow7 = he3.calculate(
        hot=flow10,
        cold=flow4
    )

    mixer2 = Mixer()
    flow16 = mixer2.mix(flow5, flow6, flow7)

    return flow16.temperature - flow1.temperature


if __name__ == '__main__':
    main()
    t_array = np.arange(300, 460, 10)
    res = np.zeros_like(t_array)
    
    for i, t in enumerate(t_array):
        res[i] = case_study(t)
    
    plt.plot(t_array, res)
    plt.tight_layout()
    plt.show()
    