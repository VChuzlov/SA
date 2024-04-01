from scipy.integrate import solve_ivp
import numpy as np
import matplotlib.pyplot as plt


def kin_func(
        t: float,
        conc: np.ndarray,
        k: np.ndarray
) -> tuple[float, float, float]:
    a, b, c = conc
    k1, k2, k3 = k
    dca_dt = - k1 * a - k2 * a + k3 * c
    dcb_dt = k1 * a
    dcc_dt = k2 * a - k3 * c
    return dca_dt, dcb_dt, dcc_dt


if __name__ == '__main__':
    conc0 = np.array([.7, .0, .0])
    k = np.array([.21, .12, .18])
    t = .0, 10.
    
    res = solve_ivp(
        fun=kin_func, 
        t_span=t, 
        y0=conc0,
        args=(k, ),
        dense_output=True
    )
    a, b, c = res.y
    for ca, cb, cc in zip(a, b, c):
        print(f'{ca:>8.4f} {cb:>8.4f} {cc:>8.4f}')
    
    _t = np.linspace(t[0], t[1], 100)
    
    a, b, c = res.sol(_t)
    
    plt.plot(_t, a, label='$C_A$')
    plt.plot(_t, b, label='$C_B$')
    plt.plot(_t, c, label='$C_C$')
    plt.xlabel('Время, с')
    plt.ylabel('Концентрация компонента, моль/л')
    plt.legend()
    plt.tight_layout()
    plt.savefig('plot.png', dpi=900)
    plt.show()    
    
    