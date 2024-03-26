import numpy as np


def convert_mass_to_volume_fractions(
    mass_fractions: np.ndarray,
    density: np.ndarray
) -> np.ndarray:
    x = mass_fractions / density
    s = x.sum()
    return x / s


def convert_mass_to_mole_fractions(
    mass_fractions: np.ndarray,
    mr: np.ndarray
) -> np.ndarray:
    x = mass_fractions / mr
    s = x.sum()
    return x / s


def get_flow_density(
    mass_fractions: np.ndarray,
    density: np.ndarray
) -> float:
    return (mass_fractions / density).sum() ** -1


def get_average_mol_mass(
    mass_fractions: np.ndarray,
    mr: np.ndarray
) -> float:
    return (mass_fractions / mr).sum() ** -1


def get_flow_cp(
    mass_fractions: np.ndarray,
    coeffs: np.ndarray,
    temperature: float
) -> float:
    p = np.arange(coeffs.shape[1])
    component_cp = ((p + 1) * coeffs * temperature ** p).sum(axis=1)
    return (component_cp * mass_fractions).sum()


def normalize(x: np.ndarray) -> np.ndarray:
    return x / x.sum()


if __name__ == '__main__':
    import constants as const
    x = np.random.randint(1, 5, 24)
    x = normalize(x)
    t = 273.15
    cp = get_flow_cp(x, const.HEATCAPACITYCOEFFS, t)
    print(cp)
