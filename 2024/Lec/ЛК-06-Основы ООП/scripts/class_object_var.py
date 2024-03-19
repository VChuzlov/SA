class Droid:
    population = 0

    def __init__(self, name: str) -> None:
        self.name = name
        print(f'** Инициализация {self.name} **')
        Droid.population += 1

    def say_hi(self) -> None:
        print(f'Приветствую! Мои хозяева называют меня {self.name}.')
    
    @staticmethod
    def how_many():
        print(f'У нас {Droid.population} дроидов.')


droid1 = Droid('R2D2')
droid1.say_hi()

Droid.how_many()

droid2 = Droid('C-3PO')
droid2.say_hi()
droid2.how_many()


def how_many(obj):
    print(f'У Вас {obj.population} дроидов.')


how_many(Droid)
