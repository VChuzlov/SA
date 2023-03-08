import numpy as np
from flows import Flow


class HeatExchanger:
    def __init__(
        self,
        d_in: float = .1,
        d_out: float = .25,
        length: float = 3.0,
        k: float = 4900
    ) -> None:
        self.d_in = d_in
        self.d_out = d_out
        self.length = length
        self.k = k

    def calculate(
        self,
        hot: Flow,
        cold: Flow,
        h: float = .01
    ) -> tuple[Flow]:
        cold_space_velocity = (
            cold.volume_flow_rate 
            / (np.pi * self.d_out ** 2 / 4 * self.length 
            - np.pi * self.d_in ** 2 / 4 * self.length)
        )
        hot_space_velocity = (
            hot.volume_flow_rate / (np.pi * self.d_in ** 2 / 4 * self.length)
        )
        cold_ = Flow(
            mass_flow_rate=cold.mass_flow_rate, 
            mass_fractions=cold.mass_fractions, 
            temperature=cold.temperature
        )
        hot_ = Flow(
            mass_flow_rate=hot.mass_flow_rate, 
            mass_fractions=hot.mass_fractions, 
            temperature=hot.temperature
        )

        l = 0
        while l <= self.length:
            hot_.temperature -= (
                self.k * np.pi * self.d_in 
                / (hot_space_velocity * hot_.density * 1e3 * hot_.flow_cp)
                * (hot_.temperature - cold_.temperature) * h
            )
            cold_.temperature += (
                self.k * np.pi * self.d_out
                / (cold_space_velocity * cold_.density * 1e3 * cold_.flow_cp)
                * (hot_.temperature - cold_.temperature) * h
            )
            l += h
            print(hot_.temperature, cold_.temperature)
        return hot_, cold_


if __name__ == '__main__':
    import converters_and_functions as conv
    mf1 = np.zeros(24)
    mf1[0] = .5
    mf1[2] = .3
    mf1[4] = .2
    mf2 = mf1
    cold = Flow(
        mass_flow_rate=1000, 
        mass_fractions=mf1, 
        temperature=273
    )
    hot = Flow(
        mass_flow_rate=1000, 
        mass_fractions=mf2, 
        temperature=300
    )
    he = HeatExchanger()
    h, c = he.calculate(hot, cold)
    print(h.temperature, c.temperature)
    