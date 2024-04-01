from scipy.integrate import quad


def func(
        t: float,
        cv: float,
        eta: float
) -> float:
    return eta * cv / t


if __name__ == '__main__':
    eta, cv = 3., 35.
    res = quad(
        func, 
        a=400, 
        b=500,
        args=(
            cv,
            eta
        )
    )
    print(f'Значение интеграла равно {res[0]:8.4f} с точностью {res[1]:8.4g}')
