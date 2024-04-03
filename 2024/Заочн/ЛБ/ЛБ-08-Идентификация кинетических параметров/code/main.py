from kinetic import kinetic_scheme
from scipy.integrate import solve_ivp
from scipy.optimize import minimize
import numpy as np
from typing import Callable
import matplotlib.pyplot as plt


def obj_func(
        k: np.ndarray,
        y: np.ndarray,
        kin_scheme: Callable,
        t: np.ndarray,
        c0: np.ndarray,
        st_matrix: np.ndarray
) -> float:
    solution = solve_ivp(
        fun=kin_scheme, 
        t_span=(t[0], t[-1]), 
        y0=c0,
        args=(
            k,
            st_matrix
        ),
        dense_output=True
    )
    y_calc = solution.sol(t)
    return ((y - y_calc[:, 1:].T) ** 2).sum()


def main() -> None:
    y = np.loadtxt(
        fname='data.txt',
        usecols=range(1, 5)
    )
    st_matrix = np.array(
        [
            [-1, 1, 0, 1],
            [0, -1, 1, 1]
        ]
    )
    t = np.arange(.0, 1.1, .1)
    res = minimize(
        fun=obj_func, 
        x0=[.1, .1],
        args=(
            y,
            kinetic_scheme,
            t,
            [1., .0, .0, .0],
            st_matrix
        )
    )
    k = res.x
    solution = solve_ivp(
        fun=kinetic_scheme, 
        t_span=(t[0], t[-1]), 
        y0=[1., .0, .0, .0],
        args=(
            k, 
            st_matrix
        ),
        dense_output=True
    )
    
    _t = np.linspace(t[0], t[-1], 100)
    y_calc = solution.sol(_t)
    
    plt.scatter(t[1:], y[:, 0])
    plt.scatter(t[1:], y[:, 1])
    plt.scatter(t[1:], y[:, 2])
    plt.scatter(t[1:], y[:, 3])
    
    plt.plot(_t, y_calc[0])
    plt.plot(_t, y_calc[1])
    plt.plot(_t, y_calc[2])
    plt.plot(_t, y_calc[3])
    plt.show()
    
    return


if __name__ == '__main__':
    main()