class Droid:
    population = 0

    def __init__(self, name: str) -> None:
        self.name = name
        print(f'** Инициализация {self.name} **')
        Droid.population += 1

    def say_hi(self) -> None:
        print(f'Приветствую! Мои хозяева называют меня {self.name}.')

    def __len__(self):
        return self.population
    

droid1 = Droid('R2D2')
droid1.say_hi()
print(f'У Вас {len(droid1)} дроидов')

droid2 = Droid('C-3PO')
droid2.say_hi()
print(f'У Вас {len(droid2)} дроидов')
print(len(droid1) == len(droid2))
