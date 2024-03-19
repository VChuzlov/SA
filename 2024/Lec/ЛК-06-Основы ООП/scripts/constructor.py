class Person:
    def __init__(self, name: str, surname: str) -> None:
        self.name = name
        self.surname = surname


person = Person(name='Петр', surname='Петров')
print(f'Привет, {person.name} {person.surname}!')

for person in [Person('Максим', 'Иванов'), Person('Мария', 'Петрова')]:
    print(f'Привет, {person.name} {person.surname}!')
