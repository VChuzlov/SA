import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt


def kin_function(
        t: float,
        conc: np.ndarray,
        k: np.ndarray
) -> tuple[float, float, float]:
    a, b, c = conc
    k1, k2, k3 = k
    dca_dt = -k1 * a - k2 * a + k3 * c
    dcb_dt = k1 * a
    dcc_dt = k2 * a - k3 * c
    return dca_dt, dcb_dt, dcc_dt


if __name__ == '__main__':
    conc0 = np.array([.7, .0, .0])
    k = np.array([.21, .12, .18])
    t = 0, 10

    sol = solve_ivp(
        fun=kin_function,
        t_span=t,
        y0=conc0,
        args=(k, ),
        dense_output=True
    )
    a, b, c = sol.y
    for ai, bi, ci in zip(a, b, c):
        print(f'{ai:>8.4f} {bi:>8.4f} {ci:>8.4f}')
    
    _t = np.linspace(t[0], t[1], 100)
    a, b, c = sol.sol(_t)
    
    plt.plot(_t, a, label='$C_A$')
    plt.plot(_t, b, label='$C_B$')
    plt.plot(_t, c, label='$C_C$')
    plt.xlabel('Время, с')
    plt.ylabel('Концентрация компонента, моль/л')
    plt.legend()
    plt.tight_layout()
    plt.show()

