import numpy as np


def equations(t: float, c: np.ndarray, k: np.ndarray) -> np.ndarray:
    cC6H12, nC6H12, C6H6, H2 = c
    k1, k2, k3 = k

    r1 = k1 * cC6H12
    r2 = k2 * cC6H12 * H2
    r3 = k3 * nC6H12

    dcC6H12_dt = -r1 - r2 + r3
    dnC6H12_dt = r2 - r3
    dC6H6_dt = r1
    dH2_dt = 3 * r1 - r2 + r3

    return np.array([dcC6H12_dt, dnC6H12_dt, dC6H6_dt, dH2_dt])


if __name__ == '__main__':
    ...