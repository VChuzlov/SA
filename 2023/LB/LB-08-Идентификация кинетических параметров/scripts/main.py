import numpy as np
from scipy.optimize import minimize
from scipy.integrate import solve_ivp
from kinetic import kinetic_scheme
import genetic_algorithm as ga


def obj_func(
    k: np.ndarray, c: np.ndarray,
    kinetic_scheme: callable,
    time: np.ndarray,
    c0: np.ndarray,
) -> float:
    """
        Целевая функция для минимизации
    """
    solution = solve_ivp(
        fun=kinetic_scheme,
        t_span=(0, time[-1]),
        y0=c0,
        dense_output=True,
        args=(k, )
    )
    c_calc = solution.sol(time)
    return ((c - c_calc[:, 1:].T) ** 2).sum()


if __name__ == '__main__':
    data = np.loadtxt('data.txt')
    h = .1
    c0 = np.array([1, 0, 0, 0])
    time = np.arange(0, 1+h, h)

    # С использованием метода Нелдера-Мида
    res_nm = minimize(
        obj_func, 
        x0=[.5, .5],
        args=(data, kinetic_scheme, time, c0),
        method='Nelder-Mead'
    )
    print(f'Нелдер-Мид: fun={res_nm.fun} x={res_nm.x}')

    # С использованием генетического алгоритма
    bounds = (.5, 2.), (.5, 2.)
    res_ga = ga.genetic_algorithm(
        bounds=bounds, 
        func=obj_func,
        popsize=100,
        selection_size=20,
        generations_count=10,
        args=(data, kinetic_scheme, time, c0)
    )[0]
    fun = obj_func(res_ga, data, kinetic_scheme, time, c0)
    print(f'Генетический алгоритм: fun={fun} x={res_ga}')
