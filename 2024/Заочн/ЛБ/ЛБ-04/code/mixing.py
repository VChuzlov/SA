def mixing(
        flow_rates: list[float],
        mass_fractions: list[list[float]]
) -> tuple[float, list[float]]:
    mix_flow_rate = sum(flow_rates)
    mass_composition = mass_fractions[:]
    
    for i in range(len(flow_rates)):
        for j in range(len(mass_composition[i])):
            mass_composition[i][j] *= flow_rates[i]
    
    new_composition = [0 for _ in range(len(mass_composition[0]))]
    for i in range(len(new_composition)):
        for j in range(len(flow_rates)):
            new_composition[i] += mass_composition[j][i]
    
    mix_composition = [value / mix_flow_rate for value in new_composition]
    return mix_flow_rate, mix_composition
