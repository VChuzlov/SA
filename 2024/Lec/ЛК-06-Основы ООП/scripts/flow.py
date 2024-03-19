import numpy as np


class Flow:
    def __init__(self, mass_flow_rate: float,
                 mass_fractions: np.ndarray,
                 temperature: float, pressure: float) -> None:
        
        self.mass_flow_rate = mass_flow_rate
        self.mass_fractions = mass_fractions
        self.temperature = temperature
        self.pressure = pressure

    def convert_mass_to_volume_fractions(self,
                                         densities: np.ndarray) -> np.ndarray:
        x = self.mass_fractions / densities
        s = x.sum()
        return x / s

    def convert_mass_to_mole_fractions(self, mr: np.ndarray) -> np.ndarray:
        x = self.mass_fractions / mr
        s = x.sum()
        return x / s

    def get_flow_density(self, densities: np.ndarray) -> float:
        return (self.mass_fractions / densities).sum() ** -1

    def get_average_molar_mass(self, mr: np.ndarray) -> float:
        return (self.mass_fractions / mr).sum() ** -1


if __name__ == '__main__':
    densities = np.array([.416, .546, .585, .5510, .6, .616, .6262, .6594])
    mr = np.array([16, 30, 44, 58, 58, 72, 72, 86])
    mass_fractions = np.array([.1, .1, .1, .4, .2, .05, .03, .02])

    f1 = Flow(mass_flow_rate=100, mass_fractions=mass_fractions,
              temperature=150, pressure=101.325)

    f1.volume_fractions = f1.convert_mass_to_volume_fractions(densities)
    f1.mole_fractions = f1.convert_mass_to_mole_fractions(mr)
    f1.density = f1.get_flow_density(densities)
    f1.mol_mass = f1.get_average_molar_mass(mr)

    print(f1.volume_fractions)
    print(f1.mole_fractions)
    print(f1.density)
    print(f1.mol_mass)
