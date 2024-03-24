import numpy as np
from scipy.integrate import solve_ivp
from typing import Callable
import matplotlib.pyplot as plt
import flow


class Reactor:
    def __init__(self, volume: float) -> None:
        self.volume = volume
        return

    def calculate(self, kinetic_equations: Callable,
                  feedstock: flow.Flow, args: tuple = (), n: int = 50) -> None:

        self.feedstock = feedstock
        self.residence_time = self.volume / self.feedstock.volume_flow_rate
        self.time = np.linspace(0, self.residence_time, n)

        self.solution = solve_ivp(
            fun=kinetic_equations, t_span=(0, self.residence_time),
            y0=self.feedstock.molar_fractions,
            dense_output=True, args=args
        )
        self.products = flow.Flow(
            volume_flow_rate=self.feedstock.volume_flow_rate,
            molar_fractions=self.solution.y[:, -1],
        )
        return

    def draw_profile(self, filename: str = '', labels: list[str] = []) -> None:
        profile = self.solution.sol(self.time)

        if not labels:
            legend = False
            labels = ('', ) * profile.shape[0]
        else:
            legend = True

        for mf, label in zip(profile, labels):
            plt.plot(self.time, mf, label=label)

        if legend:
            plt.legend()

        plt.xlabel('Время, с')
        plt.ylabel('Концентрация компонента, моль/л')
        plt.tight_layout()

        if filename:
            plt.savefig(filename, dpi=800)

        plt.show()
        return


if __name__ == '__main__':
    ...