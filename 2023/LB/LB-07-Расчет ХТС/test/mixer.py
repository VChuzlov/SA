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
            [flow.mass_fractions * flow.mass_flow_rate for flow in self.flows]
        ) / self.mass_flow_rate
        t_mean = np.mean(
            [flow.temperature for flow in self.flows]
        )
        self.mixture = Flow(
            mass_flow_rate=mass_flow_rate,
            mass_fractions=mass_fractions,
            temperature=t_mean
        )
        self.mixture.temperature = self.__calculate_temperature()

        return self.mixture
    
    def __calculate_temperature(self) -> float:
        def func(t):
            self.mixture.temperature = t
            self.mixture.recalculate()
            t_ = np.sum(
                [flow.mass_flow_rate * flow.flow_cp * flow.temperature for flow in self.flows]
            ) / (self.mixture.mass_flow_rate * self.mixture.flow_cp)
            return self.mixture.temperature - t_
        
        temperature, = fsolve(func, self.mixture.temperature)
        return temperature
    
