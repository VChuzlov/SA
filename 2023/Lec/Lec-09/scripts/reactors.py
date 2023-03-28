import numpy as np
from scipy.integrate import solve_ivp
from flows import Flow
import constants as const


class Bed:
    """Класс, используемый для описания полки катализатора"""
    def __init__(
            self,
            diameter: float = None,
            height: float = None,
            volume: float = None
    ) -> None:

        self.residence_time: float = 0

        if volume and height:
            self.volume = volume
            self.height = height
            self.diameter = (self.volume / (np.pi * self.height)) ** 0.5 * 2

        elif volume and diameter:
            self.volume = volume
            self.diameter = diameter
            self.height = self.volume / (np.pi * (self.diameter / 2) ** 2)

        elif diameter and height:
            self.diameter = diameter
            self.height = height
            self.volume = np.pi * (self.diameter / 2) ** 2 * self.height

        else:
            print('not enough data to create a catalyst bed')
            return

        self.area = np.pi * (self.diameter / 2) ** 2
    
    def __repr__(self):
        return f'Volume: {self.volume:.2f};\narea: {self.area:.2f};\nd: {self.diameter:.2f};\nh: {self.height:.2f}'

    def calculate(
        self,
        kinetic_scheme: callable,
        feedstock: Flow, 
    ) -> Flow:
        self.residence_time = (
            self.volume / feedstock.ideal_gas_volume * 3600 if feedstock.ideal_gas_volume
            else self.volume / feedstock.std_liquid_volume_flow_rate * 3600
        )
        solution = solve_ivp(
            kinetic_scheme,
            t_span=(0, self.residence_time),
            y0=feedstock.mole_fractions,  # todo: molar fractions
            args=(
                feedstock.temperature,
            )
        )
        molar_fractions = solution.y[:, -1]
        product = Flow(
            mass_flow_rate=feedstock.mass_flow_rate,
            mass_fractions=molar_fractions,
            temperature=feedstock.temperature
        )
        return product


if __name__ == '__main__':
    bed_params = {
        'diameter': .5,
        'height': 1.5,
    }
    bed = Bed(**bed_params)
    print(bed)
