from __future__ import annotations
import numpy as np
import pandas as pd
import constants as const


kinetic_matrix = pd.read_excel('kinetic_matrix.xlsx')
kinetic_matrix = kinetic_matrix.iloc[:, 1:].to_numpy()


def arrhenius_law(
    temperature: float | np.ndarray,
    ea: float | np.ndarray,
    predexp: float | np.ndarray
) -> float | np.ndarray:
    return predexp * np.exp(-ea * 1e3 / (8.314 * temperature))


def kinetic_scheme(
    time: float,
    c: np.ndarray,
    temperature: float,
    predexp: np.ndarray = const.PREDEXP,
    ea: np.ndarray = const.EA,
    stoich_matrix: np.ndarray = kinetic_matrix
) -> np.ndarray:
    k = arrhenius_law(temperature, ea, predexp)
    mask = stoich_matrix < 0
    p = (c ** -(stoich_matrix * mask)).prod(axis=1)
    reaction_rates = p * k
    
    right_parts = (
        (stoich_matrix.T * reaction_rates).sum(axis=1)
    )
    
    return right_parts


if __name__ == '__main__':
    print(kinetic_matrix)
