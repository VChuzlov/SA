import numpy as np
from scipy.optimize import fsolve
from flows import Flow


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
            [flow.temperature for flow in self.flows]
        )
        pressure = min(flow.pressure for flow in self.flows)
        self.mixture = Flow(
            mass_flow_rate=mass_flow_rate,
            mass_fractions=mass_fractions,
            temperature=t_mean,
            pressure=pressure
        )
        self.mixture.temperature = self.__calculate_temperature()
        return self.mixture
    
    def __calculate_temperature(self) -> float:
        def func(t):
            self.mixture.temperature = t
            t_ = np.sum(
                [flow.mass_flow_rate * flow.flow_cp * flow.temperature for flow in self.flows]
            ) / (self.mixture.mass_flow_rate * self.mixture.flow_cp)
            return t - t_
        
        temperature, = fsolve(func, self.mixture.temperature)
        return temperature
    

if __name__ == '__main__':
    import converters_and_functions as conv

    f1 = Flow(
        mass_flow_rate=100, 
        mass_fractions=conv.normalize(np.random.randint(1, 5, 17)), 
        temperature=250,
        pressure=101.325
    )
    f2 = Flow(
        mass_flow_rate=100, 
        mass_fractions=conv.normalize(np.random.randint(1, 5, 17)), 
        temperature=300,
        pressure=101.325
    )
    m = Mixer()
    fmixture = m.mix(f1, f2)
    print(fmixture.temperature)
