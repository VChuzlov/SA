import numpy as np
from flows import Flow
from heat_exchanger import HeatExchanger
from mixer import Mixer
from splitter import Splitter


if __name__ == '__main__':
    f1_mf = np.array(
        [
            0, 0, 0.0552, 0, 0.0006, 0.0055, 0.0055, 0.0006, 0,
            0.0828, 0, 0.1132, 0.0006, 0, 0.0006, 0.0001, 0.0001,
            0, 0.1699, 0.0276, 0, 0.5096, 0.0006, 0.0276,
        ]
    )
    f2_mf = np.array(
        [
            0, 0, 0.0975, 0, 0.001, 0.0098, 0.0098, 0.001, 0,
            0.1463, 0, 0.1463, 0.001, 0, 0.001, 0.0001, 0.0001,
            0, 0.1951, 0.0488, 0, 0.2926, 0.001, 0.0488,
        ]
    )
    f3_mf = np.array(
        [
            0, 0, 0.0864, 0, 0.0006, 0.0018, 0.0143, 0.0008, 0,
            0.0516, 0, 0.2079, 0.0002, 0, 0.0013, 0.0001, 0.0001,
            0, 0.2745, 0.0558, 0, 0.2993, 0.0012, 0.0042,
        ]
    )
    f8_mf = np.array(
        [
            0,	0,	0,	0,	0.0009,	0.0093,	0.0093,	0.0009,
            0,	0.465,	0,	0.2325,	0.0009,	0,	0.0009,	0.0001,
            0.0001,	0,	0,	0.2325,	0,	0,	0.0009,	0.0465,
        ]
    )

    # Создание потоков
    flow1 = Flow(mass_flow_rate=1130, mass_fractions=f1_mf, temperature=300)
    flow2 = Flow(mass_flow_rate=2000, mass_fractions=f2_mf, temperature=300)
    flow3 = Flow(mass_flow_rate=1700, mass_fractions=f3_mf, temperature=268)
    flow8 = Flow(mass_flow_rate=2000, mass_fractions=f8_mf, temperature=500)

    # Миксер
    mixer = Mixer()
    flow4 = mixer.mix(flow1, flow2, flow3)

    # Теплообменный аппарат
    heat_exchanger = HeatExchanger()
    flow9, flow5 = heat_exchanger.calculate(flow8, flow4)

    # Делитель
    splitter = Splitter()
    flow6, flow7 = splitter.calculate(flow5, .5, .5)

    print(flow6.temperature, flow6.mass_flow_rate)



