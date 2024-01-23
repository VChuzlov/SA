import math


def calculate_ion_concentration(
        initial_value: float,
        concentration: float,
        ka: float
) -> float:
    return (ka * (concentration - initial_value)) ** .5


def calculate(
        initial_value: float,
        concentration: float, 
        ka: float,
        eps: float = 1e-10
) -> float:
    value = calculate_ion_concentration(initial_value, concentration, ka)
    
    while abs(value - initial_value) >= eps:
        initial_value = value
        value = calculate_ion_concentration(initial_value, concentration, ka) 
    
    return value

if __name__ == '__main__':
    h_conc_0 = 0.0
    c = 0.01
    ka = 1.78e-5
    h_conc = calculate(h_conc_0, c, ka)
    ph = -math.log10(h_conc)
    print(f'Концентрация ионов H+: {h_conc:.8f}')  # Концентрация ионов H+: 0.00041309
    print(f'pH раствора: {ph:.8f}')  # pH раствора: 3.38395077
