import numpy as np
from scipy.optimize import minimize
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from typing import Callable

from kinetic import kinetic_scheme


def obj_func(
        k: np.ndarray, 
        c: np.ndarray,
        kinetic_scheme: Callable,
        time: np.ndarray,
        c0: np.ndarray,
        st_matrix: np.ndarray
) -> float:
    """Целевая функция, подлежащая минимизации.

    Args:
        k (np.ndarray): константы скоростей реакций
        kinetic_scheme (Callable): функция для расчета правых частей дифф. ур-ний
        c (np.ndarray): концентрации компонентов из исходных данных, [моль/л]
        time (np.ndarray): значения времени, которым соответствуют концентрации c
        c0 (np.ndarray): начальные концентрации компонентов, [моль/л]

    Returns:
        float: средняя квадратичная ошибка
    """
    solution = solve_ivp(
        fun=kinetic_scheme,
        t_span=(0, time[-1]),
        y0=c0,
        dense_output=True,
        args=(k, st_matrix)
    )
    c_calc = solution.sol(time)
    n = c.size
    return ((c - c_calc[:, 1:].T) ** 2).sum() / n


def calculate_kinetic_constants(
        k0: np.ndarray,
        c: np.ndarray,
        kinetic_scheme: Callable,
        time: np.ndarray,
        c0: np.ndarray,
        st_matrix: np.ndarray
) -> np.ndarray:
    res = minimize(
        fun=obj_func,
        x0=k0,
        method='Nelder-Mead',
        args=(
            c,
            kinetic_scheme,
            time,
            c0,
            st_matrix
        )
    )
    return res.x


def draw_plot() -> None:
    return


if __name__ == '__main__':
    k0 = np.array([.5, .5])
    c = np.loadtxt('data.txt', skiprows=1, usecols=range(1, 5))
    c0 = np.array([1, 0, 0, 0])
    t0, tf, h = .0, 1., .1
    time = np.arange(t0, tf+h, h)
    st_matrix = np.array(
        [
            [-1, 1, 0, 1],
            [0, -1, 1, 1]
        ]
    )

    k = calculate_kinetic_constants(
        k0, c, kinetic_scheme, time, c0, st_matrix)
    print(k)
    draw_plot()
