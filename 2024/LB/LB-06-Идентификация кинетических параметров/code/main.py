import numpy as np
from scipy.optimize import minimize
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from typing import Callable

from kinetic import kinetic_scheme


def obj_func() -> float:
    return ...


def calculate_kinetic_constants() -> np.ndarray:
    return ...


def draw_plot() -> None:
    return


if __name__ == '__main__':
    k = calculate_kinetic_constants()
    draw_plot()
