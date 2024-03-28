def convert_mass_to_volume_fractions(
        mass_fractions: list[float],
        densities: list[float]
) -> list[float]:
    mf_by_d = [mf / d for mf, d in zip(mass_fractions, densities)]
    s = sum(mf_by_d)
    return [value / s for value in mf_by_d]


def convert_mass_to_mol_fractions(
        mass_fractions: list[float],
        mr: list[float]
) -> list[float]:
    mf_by_mr = [mf / m for mf, m in zip(mass_fractions, mr)]
    s = sum(mf_by_mr)
    return [value / s for value in mf_by_mr]

def calculate_flow_density(
        mass_fractions: list[float],
        densities: list[float]
) -> float:
    mf_by_den = [mf / d for mf, d in zip(mass_fractions, densities)]
    return sum(mf_by_den) ** -1

def calculate_flow_mass(
        mass_fractions: list[float],
        mr: list[float]
) -> float:
    mf_by_mr = [mf / m for mf, m in zip(mass_fractions, mr)]
    return sum(mf_by_mr) ** -1
