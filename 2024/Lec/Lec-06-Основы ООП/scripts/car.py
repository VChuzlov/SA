class Car:
    def __init__(self, brand: str,
                 color: str, power: float) -> None:
        self.brand = brand
        self.color = color
        self.power = power
        self.speed = 0

    def go(self, acceleration_speed: float) -> None:
        self.speed += acceleration_speed

    def brake(self, braking_speed: float) -> None:
        self.speed -= braking_speed


car1 = Car(brand='Audi', color='black', power=249)
car2 = Car(brand='BMW', color='special brown', power=375)

print(car1.brand, car1.power, car1.color)
print(car2.brand, car2.power, car2.color)
