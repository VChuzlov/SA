import functions as f


if __name__ == '__main__':
    mass_fractions = [
        .1, .1, .1, .4, .2, .05, .03, .02
    ]
    densities = [
        0.416, 0.546, 0.585, 0.5510, 0.6, 0.616, 0.6262, 0.6594
    ]
    mol_mass_list = [
        16, 30, 44, 58, 58, 72, 72, 86
    ]
    
    vol_fr = f.convert_mass_to_volume_fractions(
        mass_fractions, densities
    )
    for v in vol_fr:
        print(f'{v:6.4f}')
    print(f'Сумма объемных долей: {sum(vol_fr):6.4f}')

    mol_fr = f.convert_mass_to_mol_fractions(
        mass_fractions, mol_mass_list
    )
    for v in mol_fr:
        print(f'{v:6.4f}')
    print(f'Сумма мольных долей: {sum(mol_fr):6.4f}')

    flow_density = f.calculate_flow_density(
        mass_fractions, densities
    )
    print(f'Плотность потока: {flow_density:6.4f}')

    flow_mass = f.calculate_flow_mass(
        mass_fractions, mol_mass_list
    )
    print(f'Средняя молекулярная масса потока: {flow_mass:6.4f}')
    