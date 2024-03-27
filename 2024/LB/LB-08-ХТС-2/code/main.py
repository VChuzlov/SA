import numpy as np
import flow
import reactor
import kinetic


names = 'cC6H12', 'nC6H12', 'C6H6', 'H2'
molar_fractions = np.array([.8, .2, .0, .0])  # моль/л
volume_flow_rate = 10  # л/с
v = 15  # объем реактора, л
k = np.array([.4, .05, .25])


def main() -> None:
    feedstock = flow.Flow(volume_flow_rate=volume_flow_rate,
                          molar_fractions=molar_fractions)
    r1 = reactor.Reactor(v)
    r1.calculate(kinetic_equations=kinetic.equations,
                 feedstock=feedstock, args=(k, ))
    products = r1.products

    for name, mf in zip(names, products.molar_fractions):
        print(name, mf)

    r1.draw_profile(labels=names, filename='plot.png')
    return

def main2() -> None:
    feedstock = flow.Flow(volume_flow_rate=volume_flow_rate,
                          molar_fractions=molar_fractions)
    r1 = reactor.Reactor(v)
    r2 = reactor.Reactor(1.85 * v)
    r1.calculate(
        kinetic_equations=kinetic.equations,
        feedstock=feedstock, args=(k, ))
    products = r1.products
    r2.calculate(
        kinetic_equations=kinetic.equations,
        feedstock=products,
        args=(k,)
    )
    products2 = r2.products

    for name, mf in zip(names, products2.molar_fractions):
        print(name, mf)

    r2.draw_profile(labels=names, filename='plot2.png')
    return


def main3() -> None:
    feedstock = flow.Flow(volume_flow_rate=volume_flow_rate,
                          molar_fractions=molar_fractions)
    r1 = reactor.Reactor(v)
    r1.calculate(
        kinetic_equations=kinetic.equations,
        feedstock=feedstock, args=(k, ))
    products = r1.products

    coeff = np.linspace(1.85, 3., 10)
    v_array = v * coeff
    benzene = np.zeros_like(coeff)
    for i, v2 in enumerate(v_array):
        r2 = reactor.Reactor(v2)
        r2.calculate(
            kinetic_equations=kinetic.equations,
            feedstock=products,
            args=(k,)
        )
        products2 = r2.products
        benzene[i] = products2.molar_fractions[-2]

    for v2, value in zip(v_array, benzene):
        print(f'{v2:6.4f} {value:6.4f}')
    return


if __name__ == '__main__':
    main2()
