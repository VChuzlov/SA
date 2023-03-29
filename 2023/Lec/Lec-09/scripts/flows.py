import numpy as np
import constants as const
import converters_and_functions as conv


class Flow:
    def __init__(
        self, 
        mass_flow_rate: float, 
        mass_fractions: np.ndarray, 
        temperature: float,
        pressure: float
    ) -> None:

        self.mass_flow_rate = mass_flow_rate
        self.mass_fractions = mass_fractions
        self.temperature = temperature
        self.pressure = pressure

        self.mole_fractions = conv.convert_mass_to_mole_fractions(
            self.mass_fractions, const.MR
        )
        self.volume_fractions = conv.convert_mass_to_volume_fractions(
            self.mass_fractions, const.DENSITIES
        )
        self.density = conv.get_flow_density(
            self.mass_fractions, const.DENSITIES
        )
        self.average_mol_mass = conv.get_average_mol_mass(
            self.mass_fractions, const.MR
        )
        self.mole_flow_rate = self.mass_flow_rate / self.average_mol_mass
        self.volume_flow_rate = self.mass_flow_rate / (self.density * 1e3)
        
        self.molar_fractions = conv.convert_mass_to_molar_fractions(
            self.mass_fractions, const.MR, self.density
        )

        self.ideal_gas_volume_flow_rate = (
            self.mass_flow_rate / self.ideal_gas_density
        )

    @property
    def flow_cp(self) -> float:
        flow_cp = conv.get_flow_cp(
            self.mass_fractions, const.HEATCAPACITYCOEFFS, self.temperature
        )
        return flow_cp
    
    @property
    def ideal_gas_density(self) -> float:
        return (
            self.pressure * self.average_mol_mass / (8.314 * self.temperature)
        )


if __name__ == '__main__':
    x = np.random.randint(1, 5, 17)
    x = conv.normalize(x)
    t = 500
    p = 101.325
    g = 1000
    f = Flow(
        mass_flow_rate=g, 
        mass_fractions=x, 
        temperature=t, 
        pressure=p
    )
    print(f.volume_fractions)
    print(f.molar_fractions)
    print(f.density)
    print(f.average_mol_mass)
