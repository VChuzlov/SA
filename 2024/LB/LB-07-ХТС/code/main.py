import numpy as np
from flow import Flow
from mixer import Mixer


if __name__ == '__main__':
    mf1 = np.array(
        [
            .1, .1, .1, .4, .2, .05, .03, .02,
            .0, .0, .0, .0, .0, .0,  .0,  .0,
            .0, .0, .0, .0, .0, .0,  .0,  .0,
        ]
    )
    mf2 = np.array(
        [
            .0, .0, .2, .5, .1, .15, .0, .05,
            .0, .0, .0, .0, .0, .0,  .0, .0,
            .0, .0, .0, .0, .0, .0,  .0, .0,
        ]
    )
    f1 = Flow(
        mass_flow_rate=100,
        mass_fractions=mf1,
        temperature=130
    )
    f2 = Flow(
        mass_flow_rate=120,
        mass_fractions=mf2,
        temperature=120
    )
    mixer1 = Mixer()
    f3 = mixer1.mix(f1, f2)
    print(f3.mass_flow_rate, f3.temperature)
    print(f3.mass_fractions)
