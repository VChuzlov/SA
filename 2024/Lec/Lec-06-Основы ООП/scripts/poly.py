class Cat:
    def sleep(self) -> None:
        print('Свернулся в клубок и сладко спит')


class Parrot:
    def sleep(self) -> None:
        print('Сел на жердочку и уснул')


def home_sleep(somebody: object) -> None:
    somebody.sleep()


cat = Cat()
parrot = Parrot()
home_sleep(cat)
home_sleep(parrot)
