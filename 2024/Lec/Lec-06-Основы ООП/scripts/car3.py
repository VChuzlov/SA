class Car:
    def __init__(self, brand: str,
                 color: str, power: float) -> None:
        self.__brand = brand
        self.color = color  #  публичный аттрибут (public)
        self._power = power  # защищенный аттрибут (protected)
        self.__speed = 0  # приватный аттрибут (private)

    def go(self, acceleration_speed: float) -> None:
        self.__speed += acceleration_speed

    def brake(self, braking_speed: float) -> None:
        self.__speed -= braking_speed
    
    def paint(self, color: str) -> None:
        self.color = color
    
    @property
    def brand(self) -> str:
        return self.__brand
    
    @property
    def power(self) -> float:
        return self._power

    @power.setter
    def power(self, power: float) -> None:
        if power > self._power:
            self._power = power  


class GasolineCar(Car):
    def __init__(self, brand: str, 
                 color: str, power: float, engine: str) -> None:
        super().__init__(brand, color, power)
        self.__engine = engine
    
    @property
    def engine(self) -> str:
        return self.__engine
    
    def charge(self, volume: float) -> str:
        return f'Заправить {volume} литров бензина'


class ElectricCar(GasolineCar):
    def charge(self, volume: float) -> str:
        value = super(ElectricCar, self).charge(volume)
        return value.replace('литров бензина', 'ватт электричества')


my_car = GasolineCar(brand='Jaguar', color='red', power=550, engine='gasoline')
print(my_car.charge(50))

my_car2 = ElectricCar(brand='Tesla', color='white', power=1020, engine='electric')
print(my_car2.charge(10_000))
