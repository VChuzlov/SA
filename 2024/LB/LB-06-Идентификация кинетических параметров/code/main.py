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
        k (np.ndarray): Константы скоростей реакций
        kinetic_scheme (Callable): Функция для расчета правых частей дифф. ур-ний
        c (np.ndarray): Матрица конц-ий компонентов из исх. данных, [моль/л]
        time (np.ndarray): Значения времени, которым соответствуют концентрации c
        c0 (np.ndarray): Начальные концентрации компонентов, [моль/л]

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
    """Функция для расчета констант скоростей реакций с использованием
    метода Нелдера-Мида.

    Args:
        k0 (np.ndarray): Начальное приближение для констант скоростей
        c (np.ndarray): Матрица конц-ий компонентов из исх. данных, [моль/л]
        kinetic_scheme (Callable): Функция для расчета правых частей дифф. ур-ний
        time (np.ndarray): Значения времени, которым соответствуют концентрации c
        c0 (np.ndarray): Начальные концентрации компонентов, [моль/л]
        st_matrix (np.ndarray): Матрица стехиометрических коэффициентов

    Returns:
        np.ndarray: расчетные значения констант скоростей реакций
    """
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


def draw_plot(
        t: np.ndarray,
        c: np.ndarray,
        c_calc: np.ndarray,
        labels: list[str]
) -> None:
    """Функция для построения графика изменения концентраций 
    химических веществ от времени протекания реакций 
    по исходным данным и результатам расчета.
    Создает объект рисунка в формате pdf в папке с проектом.

    Args:
        t (np.ndarray): Значения времени, которым соответствуют концентрации с0 + c 
        c (np.ndarray): Экспериментальные значения концентрации компонентов (точки)
        c_calc (np.ndarray): Расчетные значения концентрации компонентов (линии)
        labels (list[str]): Подписи к легенде на графике
    """
    fig, ax = plt.subplots()

    for i, _ in enumerate(c):
        ax.scatter(t, c[i], label=labels[i])
        ax.plot(t, c_calc[i], label=labels[i])

    ax.set_xlabel('Время, ч')
    ax.set_ylabel('Концентрация, моль/л')

    plt.legend(ncol=4)
    plt.tight_layout()
    plt.savefig('plot.pdf')
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

    c_calc = solve_ivp(
        kinetic_scheme,
        t_span=(t0, tf),
        t_eval=time,
        y0=c0,
        args=(k, st_matrix)
    ).y
    
    draw_plot(
        time, 
        np.vstack([c0.reshape(1, -1), c]).T, 
        c_calc,
        [r'$C_9H_{20}$', r'$C_9H_{18}$', r'$C_9H_{16}$', r'$H_2$']
    )
