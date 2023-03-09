from flows import Flow


class Splitter:
    def calculate(self, flow: Flow, *ratio: float) -> list[Flow]:
        results = [
            Flow(
                mass_flow_rate=r * flow.mass_flow_rate,
                mass_fractions=flow.mass_fractions,
                temperature=flow.temperature
            )
            for r in ratio
        ]
        return results


if __name__ == '__main__':
    import numpy as np
    import converters_and_functions as conv

    f = Flow(
        mass_flow_rate=300,
        mass_fractions=conv.normalize(np.random.randint(1, 5, 24)),
        temperature=273.15
    )
    spl = Splitter()
    f1, f2, f3 = spl.calculate(f, .33333, .33333, .33)
    print(f1.mass_flow_rate, f2.mass_flow_rate, f3.mass_flow_rate)
