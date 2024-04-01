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
    mf2 = np.array(
        [
            0.0000,	0.0000,	0.0975,	0.0000,	0.0010,	0.0098,	0.0098,	0.0010,	
            0.0000,	0.1463,	0.0000,	0.1463,	0.0010,	0.0000,	0.0010,	0.0001,	
            0.0001,	0.0000,	0.1951,	0.0488,	0.0000,	0.2926,	0.0010,	0.0488,
        ]
    )
    mf3 = np.array(
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
    flow2 = Flow(
        mass_flow_rate=2000,
        mass_fractions=mf2,
        temperature=301
    )
    flow3 = Flow(
        mass_flow_rate=1764,
        mass_fractions=mf3,
        temperature=268
    )

    mixer1 = Mixer()
    flow4 = mixer1.mix(flow1, flow2, flow3)
    
    flow8 = Flow(
        mass_flow_rate=3000,
        mass_fractions=mf8,
        temperature=500
    )

    splitter1 = Splitter()
    flow9, flow10, flow11 = splitter1.calculate(
        flow8, .3333, .3333, .3334
    )


    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow12, flow5 = he1.calculate(
        hot=flow9,
        cold=flow4
    )
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow13, flow6 = he2.calculate(
        hot=flow10,
        cold=flow5
    )
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow14, flow7 = he3.calculate(
        hot=flow11,
        cold=flow6
    )

    mixer2 = Mixer()
    flow15 = mixer2.mix(flow12, flow13, flow14)

    print('====Flow15====')
    print(f'Массовый расход: {flow15.mass_flow_rate:>8.2f}')
    print(f'Температура: {flow15.temperature:>8.2f}')
    print(f'Состав {flow15.mass_fractions}')

    print('====Flow7====')
    print(f'Массовый расход: {flow7.mass_flow_rate:>8.2f}')
    print(f'Температура: {flow7.temperature:>8.2f}')
    print(f'Состав {flow7.mass_fractions}')

    return


def case_study(flow_rate: float) -> float:
    mf1 = np.array(
        [
            0.0000,	0.0000,	0.0975,	0.0000,	0.0010,	0.0098,	0.0098,	0.0010,	
            0.0000,	0.1463,	0.0000,	0.1463,	0.0010,	0.0000,	0.0010,	0.0001,	
            0.0001,	0.0000,	0.1951,	0.0488,	0.0000,	0.2926,	0.0010,	0.0488,
        ]
    )
    mf2 = np.array(
        [
            0.0000,	0.0000,	0.0975,	0.0000,	0.0010,	0.0098,	0.0098,	0.0010,	
            0.0000,	0.1463,	0.0000,	0.1463,	0.0010,	0.0000,	0.0010,	0.0001,	
            0.0001,	0.0000,	0.1951,	0.0488,	0.0000,	0.2926,	0.0010,	0.0488,
        ]
    )
    mf3 = np.array(
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
    flow2 = Flow(
        mass_flow_rate=flow_rate,
        mass_fractions=mf2,
        temperature=301
    )
    flow3 = Flow(
        mass_flow_rate=1764,
        mass_fractions=mf3,
        temperature=268
    )

    mixer1 = Mixer()
    flow4 = mixer1.mix(flow1, flow2, flow3)
    
    flow8 = Flow(
        mass_flow_rate=3000,
        mass_fractions=mf8,
        temperature=500
    )

    splitter1 = Splitter()
    flow9, flow10, flow11 = splitter1.calculate(
        flow8, .3333, .3333, .3334
    )


    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow12, flow5 = he1.calculate(
        hot=flow9,
        cold=flow4
    )
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow13, flow6 = he2.calculate(
        hot=flow10,
        cold=flow5
    )
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.
    )
    flow14, flow7 = he3.calculate(
        hot=flow11,
        cold=flow6
    )

    mixer2 = Mixer()
    flow15 = mixer2.mix(flow12, flow13, flow14)

    return flow7.temperature


if __name__ == '__main__':
    main()
    flow_rate_values = np.arange(2500, 1950, -50)
    res = np.zeros_like(flow_rate_values)
    for i, flow_rate in enumerate(flow_rate_values):
        res[i] = case_study(flow_rate)
    
    plt.plot(flow_rate_values, res)
    plt.tight_layout()
    plt.show()
