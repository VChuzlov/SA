class Predator:
    def hunt(self) -> None:
        print('...hunting...')


class Cat(Predator):
    def __init__(self, name: str, color: str) -> None:
        super().__init__()
        self.name = name
        self.color = color


cat = Cat(name='Felix', color='ginger')
cat.hunt()
