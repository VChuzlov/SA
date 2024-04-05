import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize
from typing import Callable
import matplotlib.pyplot as plt
from kinetic import kinetic_scheme


def obj_func(
        k: np.ndarray,
        y: np.ndarray,
        func: Callable,
        t: np.ndarray,
        st_matrix: np.ndarray,
        y0: np.ndarray
) -> float:
    solution = solve_ivp(
        fun=func,
        t_span=(t[0], t[-1]), 
        y0=y0,
        args=(k, st_matrix),
        dense_output=True
    )
    y_calc = solution.sol(t)
    return ((y.T - y_calc[:, 1:]) ** 2).sum()



def main() -> None:
    data = np.loadtxt('data.txt', usecols=range(1, 5))
    st_matrix = np.array(
        [
            [-1, 1, 0, 1],
            [0, -1, 1, 1]
        ]
    )
    t = np.arange(.0, 1.1, .1)
    c0 = np.array([1., .0, .0, .0])
    res = minimize(
        fun=obj_func, 
        x0=[.1, .1],
        args=(
            data,
            kinetic_scheme,
            t,
            st_matrix,
            c0
        )
    )
    _k = res.x
    solution = solve_ivp(
        fun=kinetic_scheme, 
        t_span=[t[0], t[-1]], 
        y0=c0,
        args=(_k, st_matrix),
        dense_output=True
    )
    y_calc = solution.sol(t)
    for row in y_calc:
        for v in row:
            print(f'{v:>8.4f}', end=' ')
        print()
    
    plt.scatter(t[1:], data[:, 0], label='C9H20')
    plt.scatter(t[1:], data[:, 1], label='C9H18')
    plt.scatter(t[1:], data[:, 2], label='C9H16')
    plt.scatter(t[1:], data[:, 3], label='H2')
    
    plt.plot(t, y_calc[0])
    plt.plot(t, y_calc[1])
    plt.plot(t, y_calc[2])
    plt.plot(t, y_calc[3])
    
    plt.xlabel('Время, с')
    plt.ylabel('Концентрация, моль/л')
    
    plt.legend(ncol=2)
    plt.tight_layout()
    plt.savefig('plot.png', dpi=900)
    plt.show()
        
    return


if __name__ == '__main__':
    main()
