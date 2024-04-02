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


my_car = Car(brand='Audi', color='black', power=249)
print(my_car.power, my_car.brand, my_car.color)

my_car.power = 320
print(my_car.power, my_car.brand, my_car.color)

my_car.paint('white')
print(my_car.power, my_car.brand, my_car.color)
