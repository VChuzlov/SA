import numpy as np
from scipy.integrate import solve_ivp
from flows import Flow
import constants as const
import converters_and_functions as conv
from kinetic import kinetic_scheme
from mixer import Mixer
from typing import Callable


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

    def __repr__(self) -> str:
        return (f'Volume: {self.volume:.2f};\narea: {self.area:.2f};'
                + f'\nd: {self.diameter:.2f};\nh: {self.height:.2f}')

    def calculate(
        self,
        kinetic_scheme: Callable,
        feedstock: Flow,
        ea: np.ndarray,
        predexp: np.ndarray
    ) -> Flow:
        self.residence_time = (
            self.volume / feedstock.ideal_gas_volume_flow_rate * 3600
        )
        solution = solve_ivp(
            kinetic_scheme,
            t_span=(0, self.residence_time),
            y0=feedstock.molar_fractions,
            args=(
                feedstock.temperature,
                predexp,
                ea
            )
        )
        molar_fractions = solution.y[:, -1]
        mf = conv.convert_molar_to_mass_fractions(
            molar_fractions, const.MR, feedstock.ideal_gas_density
        )
        product = Flow(
            mass_flow_rate=feedstock.mass_flow_rate,
            mass_fractions=mf,
            temperature=feedstock.temperature,
            pressure=feedstock.pressure
        )
        return product


class Reactor:
    """Класс для описания реактора, представленного в виде массива полок"""

    def __init__(
        self,
        *bed_params: dict
    ) -> None:
        self.beds = [Bed(**params) for params in bed_params]

    def calculate(
        self,
        kinetic_scheme: Callable,
        feedstock: Flow,
        ea: np.ndarray = const.EA,
        predexp: np.ndarray = const.PREDEXP
    ) -> Flow:
        self.feedstock = feedstock
        f = self.feedstock

        for bed in self.beds:
            f = bed.calculate(
                kinetic_scheme=kinetic_scheme,
                feedstock=f,
                ea=ea,
                predexp=predexp
            )
        self.product = f
        return self.product

    def performance(self) -> dict:
        perf = {
            'Выход изомеризата, % масс.': (
                self.product.mass_fractions[const.indxs].sum()
                / self.feedstock.mass_fractions[const.indxs].sum()
            ) * 100,
            'Выход изоалканов, % масс.': (
                self.product.mass_fractions[[1, 5, 9, 13]].sum()
                / (1 - self.product.mass_fractions[[3, 16]].sum())
            ) * 100,
        }
        return perf


if __name__ == '__main__':
    mf = np.array(
        [
            0.1784, 0.0557, 0.0223, 0., 0.0948, 0.1171, 0.0446,
            0.0056, 0.1587, 0.146, 0.1066, 0.0168, 0.0123,
            0.0293, 0.0118, 0., 0.,
        ]
    )
    f = Flow(
        50_000,
        mf,
        temperature=423.15,
        pressure=3001.325
    )
    h2_mf = np.zeros_like(mf)
    h2_mf[3] = 1.
    h2 = Flow(
        mass_flow_rate=80,
        mass_fractions=h2_mf,
        temperature=423.15,
        pressure=3001.325
    )
    mxr = Mixer()
    feedstock = mxr.mix(f, h2)
    r = Reactor(*const.bed_params)
    product = r.calculate(kinetic_scheme, feedstock, predexp=const.PREDEXP)
    perf = r.performance()
    for key in perf:
        print(f'{key}: {perf[key]:.2f}')
    print(product.mass_fractions)
