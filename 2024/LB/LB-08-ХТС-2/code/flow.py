import numpy as np


class Flow:
    def __init__(
	    self,
	    volume_flow_rate: float,
	    molar_fractions: np.ndarray
	) -> None:
        self.volume_flow_rate = volume_flow_rate
        self.molar_fractions = molar_fractions
        return
  

if __name__ == '__main__':
    ...