import numpy as np
from flow import Flow
from mixer import Mixer
import matplotlib.pyplot as plt


def ex_1():
    mf = np.array(
        [
            0.0570,   0.0076,   0.0114,   0.0418,   0.0152,   0.0342,   0.0684,   0.0152,
            0.0532,   0.0342,   0.0608,   0.0608,   0.0684,   0.0380,   0.0608,   0.0608,
            0.0190,   0.0494,   0.0570,   0.0646,   0.0304,   0.0228,   0.0190,   0.0494,
        ]
    )
    t0, tf, count = 20, 350, 100
    t_array = np.linspace(t0, tf, count)
    f = Flow(
        mass_flow_rate=100,
        temperature=t0,
        mass_fractions=mf
    )
    cp_array = np.zeros_like(t_array)
    for i, t in enumerate(t_array):
        f.temperature = t
        cp_array[i] = f.flow_cp
    
    # plt.style.use('dark_background')
    # fig, ax = plt.subplots()
    # ax.plot(t_array, cp_array)
    # ax.set_xlabel('Температура, °С')
    # ax.set_ylabel('Теплоемкость потока')
    # plt.tight_layout()
    # plt.show()
    return


def ex2():
    mf1 = np.array(
        [
            0.0874,   0.0273,   0.0383,   0.0219,   0.0984,   0.0437,   0.0109,   0.0546, 
            0.0383,   0.0437,   0.0164,   0.0984,   0.0765,   0.0055,   0.0164,   0.0219,
            0.0109,   0.0656,   0.0328,   0.0984,   0.0109,   0.0164,   0.0109,   0.0546,
        ]
    )
    mf2 = np.array(
        [
            0.0218,   0.0306,   0.0349,   0.0742,   0.0349,   0.0524,   0.0044,   0.0830, 
            0.0480,   0.0437,   0.0131,   0.0393,   0.0611,   0.0655,   0.0437,   0.0742,
            0.0175,   0.0349,   0.0131,   0.0393,   0.0611,   0.0437,   0.0218,   0.0437,
        ]
    )
    mf3 = np.array(
        [
            0.0441,   0.0098,   0.0196,   0.0343,   0.0833,   0.0147,   0.0147,   0.0049, 
            0.0441,   0.0392,   0.0637,   0.0539,   0.0147,   0.0098,   0.0245,   0.0343,
            0.0686,   0.0539,   0.0931,   0.0735,   0.0637,   0.0245,   0.0196,   0.0931,
        ]
    )
    f1 = Flow(
        mass_flow_rate=1000,
        mass_fractions=mf1,
        temperature=150
    )
    f2 = Flow(
        mass_flow_rate=1500,
        mass_fractions=mf2,
        temperature=120
    )
    f3 = Flow(
        mass_flow_rate=1200,
        mass_fractions=mf3,
        temperature=250
    )
    mixer1 = Mixer()
    f4 = mixer1.mix(f1, f2, f3)
    print(f4.mass_flow_rate, f4.temperature)
    print(f4.mass_fractions)
    return


if __name__ == '__main__':
    ex2()
# 3700 127.87305682120657
# [0.04676216 0.02296216 0.03085676 0.04712432 0.06775946 0.03782162
#  0.0094973  0.04999459 0.04411351 0.04224054 0.0304027  0.06000811
#  0.05021351 0.03121892 0.03009459 0.04712432 0.03228919 0.04935946
#  0.04437027 0.06636486 0.04837568 0.03009459 0.01814054 0.06266757]
