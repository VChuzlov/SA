import numpy as np
from scipy.integrate import solve_ivp


kinetic_matrix = np.array(
    [
        [-1, 1, 0, 1],
        [0, -1, 1, 1]
    ]
)


def kinetic_scheme(
    time: float,
    c: np.ndarray,
    k: np.ndarray,
    stoich_matrix: np.ndarray = kinetic_matrix
) -> np.ndarray:

    mask = stoich_matrix < 0
    p = (c ** -(stoich_matrix * mask)).prod(axis=1)
    reaction_rates = p * k
    
    right_parts = (
        (stoich_matrix.T * reaction_rates).sum(axis=1)
    )
    
    return right_parts


def main() -> None:
    '''
        Функция для тестирования и проверки
        работоспособности кода.
        Выводит значения правых частей 
        дифференциальных уравнений.
    '''
    c = np.array([1, 0, 0, 0])
    k = np.array([.85, .5])
    time = .1
    print(kinetic_scheme(time, c, k))
    return


def test_kinetic_constants() -> None:
    """ 
        Функция для проверки констант скоростей.
        Выводит значения концентраций компонентов
        в каждый момент времени.
    """
    time = np.arange(0, 1.1, .1)
    k = np.array([1.7939239513204417, 1.0262965367591952])
    solution = solve_ivp(
        fun=kinetic_scheme, 
        t_span=(time[0], time[-1]), 
        y0=[1, 0, 0, 0],
        dense_output=True,
        args=(k, )
    )
    c9h20, c9h18, c9h16, h2  = solution.sol(time)
    for line in zip(c9h20, c9h18, c9h16, h2):
        print('{:>8.4f} {:>8.4f} {:>8.4f} {:>8.4f}'.format(*line))

    return


if __name__ == '__main__':
    # main()
    test_kinetic_constants()
