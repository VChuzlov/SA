from flows import Flow
from mixer import Mixer
from heat_exchanger import HeatExchanger
from splitter import Splitter
import converters_and_functions as conv
import numpy as np


if __name__ == '__main__':
    mf = np.random.randint(1, 10, 24)
    mf = conv.normalize(mf)
    f1 = Flow(
        mass_flow_rate=100, 
        mass_fractions=mf, 
        temperature=273.15
    )
    f2 = Flow(
        mass_flow_rate=200, 
        mass_fractions=mf, 
        temperature=293.15
    )
    f3 = Flow(
        mass_flow_rate=150, 
        mass_fractions=mf, 
        temperature=573.15
    )
    m = Mixer()
    f4 = m.mix(f1, f2, f3)
    # print(f4.temperature)
    f5 = Flow(
        mass_flow_rate=1000, 
        mass_fractions=mf, 
        temperature=273.15
    )
    he = HeatExchanger()
    f6, f7 = he.calculate(f4, f5)
    # print(f6.temperature, f7.temperature)
    spl = Splitter()
    f8, f9 = spl.calculate(f6, .3, .7)
    print(f8.mass_flow_rate, f9.mass_flow_rate)
