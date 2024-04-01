from scipy.interpolate import interp1d
from scipy.optimize import least_squares
import numpy as np
from typing import Callable
import matplotlib.pyplot as plt


def interpolation(
        x: np.ndarray,
        y: np.ndarray,
        kind: str,
        _x: np.ndarray
) -> np.ndarray:
    f = interp1d(x, y, kind=kind)
    return f(_x)


def linear(
        params: tuple[float, float],
        x: float
) -> float:
    k, b = params
    return k * x + b


def residuals(
        params: tuple[float, float],
        y: np.ndarray,
        func: Callable,
        x: np.ndarray
) -> np.ndarray:
    _y = func(params, x)
    return y - _y


def approximation(
        x: np.ndarray,
        y: np.ndarray,
        _x: np.ndarray,
        func: Callable
) -> np.ndarray:
    x0 = [.0, .0]
    params = least_squares(
        fun=residuals,
        x0=x0,
        args=(
            y,
            func,
            x
        )
    ).x
    return func(params, _x)


if __name__ == '__main__':
    t = np.arange(300, 1100, 100)
    dh = np.array(
        [
            29.62, 21.88, 15.52, 10.38, 6.40, 3.35, 1.13, .21
        ]
    )
    _t = np.arange(300, 1050, 50)
    _dh = interpolation(
        x=t, 
        y=dh, 
        kind='cubic', 
        _x=_t
    )
    for ti, hi in zip(_t, _dh):
        print(f'{ti:>4.0f} {hi:>8.4f}')
        
    print()
    print('Результаты аппроксимации')
    
    
    _dh_approx = approximation(
        x=t, 
        y=dh, 
        _x=_t, 
        func=linear
    )
    for ti, hi in zip(_t, _dh_approx):
        print(f'{ti:>4.0f} {hi:>8.4f}')
        
    plt.scatter(t, dh, label='Исходные данные')
    plt.plot(_t, _dh, label='Интерполяция')
    plt.plot(_t, _dh_approx, label='Аппроксимация')
    plt.legend()
    plt.tight_layout()
    plt.show()    
    
    
