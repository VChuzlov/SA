import numpy as np


def kinetic_scheme(
        time: float,
        c: np.ndarray,
        k: np.ndarray,
        stoich_matrix: np.ndarray
) -> np.ndarray:
    """Реализация расчета правых частей системы дифференциальных уравнений,
    описывающих изменение концентрации компонентов, 
    участвующих в химических превращениях.

    Args:
        time (float): времени из интервала, на котором наблюдается процесс 
        c (np.ndarray): концентрации компонентов, [моль/л]
        k (np.ndarray): константы скорости реакций, входящих в схему
        stoich_matrix (np.ndarray): матрица стехиометрических коэффициентов

    Returns:
        np.ndarray: значения правых частей уравнений сис-мы дифф. ур-ний
    """

    mask = stoich_matrix < 0  # Выбираем элементы с отрицательными стехим. коэфф-тами
    p = (c ** -(stoich_matrix * mask)).prod(axis=1)  # Произвед. конц-ий реагентов
    reaction_rates = p * k  # массив скоростей реакций
    
    right_parts = (
        (stoich_matrix.T * reaction_rates).sum(axis=1)
    )
    
    return right_parts


if __name__ == '__main__':
    print(help(kinetic_scheme))
