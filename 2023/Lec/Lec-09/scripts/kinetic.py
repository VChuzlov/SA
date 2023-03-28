import numpy as np
import pandas as pd
import constants as const


kinetic_matrix = pd.read_excel('kinetic_matrix.xlsx')
kinetic_matrix = kinetic_matrix.iloc[:, 1:].to_numpy()


def kinetic_scheme(
    time: float,
    c: np.ndarray,
    temperature: float,
    predexp: np.ndarray = const.PREDEXP,
    ea: np.ndarray = const.EA,
    stoich_matrix: np.ndarray = kinetic_matrix
) -> np.ndarray:

    mask = stoich_matrix < 0
    p = (c ** -(stoich_matrix * mask)).prod(axis=1)
    reaction_rates = p * k
    
    right_parts = (
        (stoich_matrix.T * reaction_rates).sum(axis=1)
    )
    
    return right_parts


if __name__ == '__main__':
    print(kinetic_matrix)
