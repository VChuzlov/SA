import numpy as np
from scipy.integrate import solve_ivp
from flows import Flow
import constants as const
import converters_and_functions as conv
from kinetic import kinetic_scheme


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
            self.volume / feedstock.ideal_gas_volume_flow_rate * 3600
        )
        solution = solve_ivp(
            kinetic_scheme,
            t_span=(0, self.residence_time),
            y0=feedstock.molar_fractions,  # todo: molar fractions
            args=(
                feedstock.temperature,
            )
        )
        molar_fractions = solution.y[:, -1]
        mf = conv.convert_molar_to_mass_fractions(molar_fractions, const.MR)
        product = Flow(
            mass_flow_rate=feedstock.mass_flow_rate,
            mass_fractions=mf,
            temperature=feedstock.temperature,
            pressure=feedstock.pressure
        )
        return product


class Reactor:
    """Класс для описания реактора, состоящего из массива полок"""

if __name__ == '__main__':
    bed_params = {
        'diameter': .5,
        'height': 1.5,
    }
    bed = Bed(**bed_params)
    f = Flow(
        1000, 
        conv.normalize(np.random.random(17)), 
        temperature=273.15,
        pressure=101.325
    )
    product = bed.calculate(kinetic_scheme, f)
    print(product.mass_fractions)
