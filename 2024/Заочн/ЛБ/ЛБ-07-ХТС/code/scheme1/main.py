from flows import Flow
from splitter import Splitter
from mixer import Mixer
from heat_exchanger import HeatExchanger
import numpy as np
import matplotlib.pyplot as plt


def main() -> None:
    mf1 = np.array(
        [
            0,	0,	0.0975,	0,	0.001,	0.0098,	0.0098,	0.001,	0,	0.1463,	0,	
            0.1463,	0.001,	0,	0.001,	0.0001,	0.0001,	0,	0.1951,	0.0488,	0,	
            0.2926,	0.001,	0.0488, 
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
    flow8 = Flow(
        mass_flow_rate=3000, 
        mass_fractions=mf8, 
        temperature=500
    )
    
    splitter1 = Splitter()
    flow2, flow3, flow4 = splitter1.calculate(
        flow1, .3333, .3333, .3334
    )
    
    splitter2 = Splitter()
    flow9, flow10, flow11 = splitter2.calculate(
        flow8, .3333, .3333, .3334
    )
    
    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    flow12, flow5 = he1.calculate(flow9, flow2)
    flow14, flow6 = he2.calculate(flow11, flow3)
    flow13, flow7 = he3.calculate(flow10, flow4)
    
    mixer1 = Mixer()
    mixer2 = Mixer()

    flow15 = mixer1.mix(flow12, flow13, flow14)
    flow16 = mixer2.mix(flow5, flow6, flow7)

    print('====Flow15====')
    print(f'Массовый рассход {flow15.mass_flow_rate:>8.2f}')
    print(f'Температура {flow15.temperature:>8.2f}')
    print(f'Массовые доли {flow15.mass_fractions}')
    
    print('====Flow16====')
    print(f'Массовый рассход {flow16.mass_flow_rate:>8.2f}')
    print(f'Температура {flow16.temperature:>8.2f}')
    print(f'Массовые доли {flow16.mass_fractions}')
    
    return


def case_study(temperature: float) -> float:
    mf1 = np.array(
        [
            0,	0,	0.0975,	0,	0.001,	0.0098,	0.0098,	0.001,	0,	0.1463,	0,	
            0.1463,	0.001,	0,	0.001,	0.0001,	0.0001,	0,	0.1951,	0.0488,	0,	
            0.2926,	0.001,	0.0488, 
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
    flow8 = Flow(
        mass_flow_rate=3000, 
        mass_fractions=mf8, 
        temperature=500
    )
    
    splitter1 = Splitter()
    flow2, flow3, flow4 = splitter1.calculate(
        flow1, .3333, .3333, .3334
    )
    
    splitter2 = Splitter()
    flow9, flow10, flow11 = splitter2.calculate(
        flow8, .3333, .3333, .3334
    )
    
    he1 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    he2 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    he3 = HeatExchanger(
        d_in=.15,
        d_out=.4,
        length=3.,
        k=4900
    )
    
    flow12, flow5 = he1.calculate(flow9, flow2)
    flow14, flow6 = he2.calculate(flow11, flow3)
    flow13, flow7 = he3.calculate(flow10, flow4)
    
    mixer1 = Mixer()
    mixer2 = Mixer()

    flow15 = mixer1.mix(flow12, flow13, flow14)
    flow16 = mixer2.mix(flow5, flow6, flow7)

    
    return flow16.temperature - flow1.temperature


if __name__ == '__main__':
    main()
    t_array = np.arange(300, 460, 10)
    result = np.zeros_like(t_array)
    
    for i, t in enumerate(t_array):
        result[i] = case_study(t)
    
    plt.plot(t_array, result)
    # plt.tight_lyaout()
    plt.savefig('plot.png', dpi=900)
    plt.show()
    
