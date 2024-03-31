from scipy.interpolate import interp1d
from scipy.optimize import least_squares
import numpy as np
from typing import Callable


def interpolation(
        x: np.ndarray,
        y: np.ndarray,
        kind: str,
        _x: np.ndarray
) -> np.ndarray:
    f = interp1d(
        x,
        y,
        kind=kind
    )
    return f(_x)

def linear(
        params: tuple[float, float],
        x: float
) -> float:
    a, b = params
    return a + b * x

def residuals(
        params: tuple[float, float],
        func: Callable,
        y: np.ndarray,
        x: np.ndarray
) -> np.ndarray:
    y_calc = func(params, x)
    return y_calc - y

def approximation(
        x: np.ndarray,
        y: np.ndarray,
        _x: np.ndarray
) -> np.ndarray:
    params0 = [.0, .0]
    params = least_squares(
        fun=residuals,
        x0=params0,
        args=(
            linear,
            y,
            x
        )
    ).x
    return linear(params, _x)


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

    print('Approximation results')
    _dh_line = approximation(
        x=t,
        y=dh,
        _x=_t
    )
    for ti, hi in zip(_t, _dh_line):
        print(f'{ti:>4.0f} {hi:>8.4f}')
    