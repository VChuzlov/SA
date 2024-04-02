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
    mf2 = np.array(
        [
            0,	0,	0.0975,	0,	0.001,	0.0098,	0.0098,	0.001,	0,	0.1463,	0,	
            0.1463,	0.001,	0,	0.001,	0.0001,	0.0001,	0,	0.1951,	0.0488,	0,	
            0.2926,	0.001,	0.0488, 
        ]
    )
    mf3 = np.array(
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
    flow2 = Flow(
        mass_flow_rate=1159, 
        mass_fractions=mf2, 
        temperature=300
    )
    flow3 = Flow(
        mass_flow_rate=1159, 
        mass_fractions=mf3, 
        temperature=300
    )
    flow8 = Flow(
        mass_flow_rate=3000, 
        mass_fractions=mf8, 
        temperature=500
    )
    
    mixer1 = Mixer()
    flow4 = mixer1.mix(flow1, flow2, flow3)

    splitter = Splitter()
    flow9, flow10, flow11 = splitter.calculate(
        flow8, .3333, .3333, .3334
    )
    
    he1 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    he2 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    he3 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    
    flow12, flow5 = he1.calculate(flow9, flow4)
    flow13, flow6 = he2.calculate(flow10, flow5)
    flow14, flow7 = he3.calculate(flow11, flow6)
    
    mixer2 = Mixer()
    flow15 = mixer2.mix(flow12, flow13, flow14)
    

    print('====Flow15====')
    print(f'Массовый рассход {flow15.mass_flow_rate:>8.2f}')
    print(f'Температура {flow15.temperature:>8.2f}')
    print(f'Массовые доли {flow15.mass_fractions}')
    
    print('====Flow7====')
    print(f'Массовый рассход {flow7.mass_flow_rate:>8.2f}')
    print(f'Температура {flow7.temperature:>8.2f}')
    print(f'Массовые доли {flow7.mass_fractions}')
    
    return


def case_study(mass_flow_rate: float) -> float:
    mf1 = np.array(
        [
            0,	0,	0.0975,	0,	0.001,	0.0098,	0.0098,	0.001,	0,	0.1463,	0,	
            0.1463,	0.001,	0,	0.001,	0.0001,	0.0001,	0,	0.1951,	0.0488,	0,	
            0.2926,	0.001,	0.0488, 
        ]
    )
    mf2 = np.array(
        [
            0,	0,	0.0975,	0,	0.001,	0.0098,	0.0098,	0.001,	0,	0.1463,	0,	
            0.1463,	0.001,	0,	0.001,	0.0001,	0.0001,	0,	0.1951,	0.0488,	0,	
            0.2926,	0.001,	0.0488, 
        ]
    )
    mf3 = np.array(
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
    flow2 = Flow(
        mass_flow_rate=mass_flow_rate, 
        mass_fractions=mf2, 
        temperature=300
    )
    flow3 = Flow(
        mass_flow_rate=1159, 
        mass_fractions=mf3, 
        temperature=300
    )
    flow8 = Flow(
        mass_flow_rate=3000, 
        mass_fractions=mf8, 
        temperature=500
    )
    
    mixer1 = Mixer()
    flow4 = mixer1.mix(flow1, flow2, flow3)

    splitter = Splitter()
    flow9, flow10, flow11 = splitter.calculate(
        flow8, .3333, .3333, .3334
    )
    
    he1 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    he2 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    he3 = HeatExchanger(
        d_in=.2,
        d_out=.42,
        length=3.06,
        k=4900
    )
    
    flow12, flow5 = he1.calculate(flow9, flow4)
    flow13, flow6 = he2.calculate(flow10, flow5)
    flow14, flow7 = he3.calculate(flow11, flow6)
    
    mixer2 = Mixer()
    flow15 = mixer2.mix(flow12, flow13, flow14)
    
    return flow7.temperature


if __name__ == '__main__':
    main()
    mass_flow_rate_values = np.arange(2500, 1950, -50)
    temperate_values = np.zeros_like(mass_flow_rate_values)
    
    for i, r in enumerate(mass_flow_rate_values):
        temperate_values[i] = case_study(r)
    
    plt.plot(mass_flow_rate_values, temperate_values)
    plt.tight_layout()
    plt.show()
    plt.savefig('plot.png', dpi=900)
    