import numpy as np
from flow import Flow


class Mixer:
    def mix(self, *flows: Flow) -> Flow:
        self.flows = flows
        
        mass_flow_rate = np.sum(
            [flow.mass_flow_rate for flow in self.flows]
        )
        
        mass_fractions = np.sum(
            [flow.mass_fractions * flow.mass_flow_rate for flow in self.flows],
            axis=0,
        ) / mass_flow_rate
        
        t_mean = np.mean(
            [flow.temperature for flow in self.flows]  # так неправильно!!
        )
        
        pressure = min(flow.pressure for flow in self.flows)
        
        self.mixture = Flow(
            mass_flow_rate=mass_flow_rate,
            mass_fractions=mass_fractions,
            temperature=t_mean,
            pressure=pressure
        )
        
        return self.mixture


if __name__ == '__main__':
    mf1 = np.random.randint(1, 5, 8)
    mf1 = mf1 / mf1.sum()
    mf2 = np.random.randint(1, 5, 8)
    mf2 = mf2 / mf2.sum()

    f1 = Flow(mass_flow_rate=100, mass_fractions=mf1,
              temperature=250, pressure=101.325
    )

    f2 = Flow(mass_flow_rate=100, mass_fractions=mf2,
              temperature=300, pressure=101.325)
    m = Mixer()
    mixture = m.mix(f1, f2)
    print(mixture.temperature)
    print(mixture.mass_fractions)
