---
marp: true
theme: default
# class:
#   - invert
size: 16:9
fontsize: 12px

style: |
  section::after {
      content: 'Слайд ' attr(data-marpit-pagination) ' / ' attr(data-marpit-pagination-total);
    }


    h1 {
      color: 	rgb(40, 190, 70);
    }
    
    .columns {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 1rem;
    }
    
    .columns3 {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 1rem;
    }

    .small-text {
      font-size: 1.45rem;
    }
    .headerless {
          display: none;
      }
    
       
    blockquote {
      border-left: rgb(101,115,255) solid;
      color: rgb(101,115,255);
    }

    body {
        code-size: 1em;
    }

math: mathjax
---

<style>
section {
  font-family: 'Roboto', 'Segoe UI', 'Liberation Sans', 'Helvetica', 'Arial', sans-serif !important;
  font-size: 1.55rem;
  padding: 3.5rem;
  justify-content: start;
}
</style>



![bg left:30% opacity:.45](texture.jpg)

<p align="center">
  <img src='TPU-logo_ver-parade-color-ru-cmyk.svg'
    width="270"
  />
</p>


<center>

<br>

# Системный анализ процессов переработки нефти и газа

## Лекция №2 <br> Структуры данных: словари и множества. <br> Функции в Python


<br>
Вячеслав Алексеевич Чузлов

к.т.н., доцент ОХИ ИШПР ТПУ 



---

<!-- paginate: true -->


<style scoped>
  section {
    justify-content: center;
    font-size: 40px;
  }
</style>

![bg right:40% opacity:.35](section5.jpg)

# Словари (dict)



<!-- _paginate: skip -->

---

# Словари (dict)

- В Python словарь – это тип «ассоциативного массива», представляющего набор пар ключ-значение (key-value).
- Словарь может содержать любые объекты как значения (values), но, в отличие от списков и кортежей, каждый элемент в словаре индексируется уникальным ключом (key), который может быть любым **неизменяемым** объектом.
- Словари являются <mark>изменяемыми</mark> объектами.

Словарь можно определить с помощью пар `key:value`, записанных в фигурных скобках:

```python
height = {
    'Burj Khalifa': 828., 
    'One World Trade Center': 541.3,
    'Mercury City Tower': '', 
    'Q1': 323.,
    'Carlton Centre': 223., 
    'Gran Torre Santiago': 300.,
    'Mercury City Tower': 339.
}
```

---

# Определение и индексирование словаря

- Отдельный элемент можно извлечь по его ключу, применяемому в качестве индекса, или с помощью переменной, значение которой равно ключу:

```python
print(height['One World Trade Center'])  # 541.3
building = 'Carlton Centre'
print(height[building])  # 223.0
```
<br>

- Элементы (значения) в словаре также можно присваивать по индексу

```python
height['Empire State Building'] = 381.  # добавление нового элемента присваоиванием по ключу
height['The Shard'] = 306.
```
---

# Определение и индексирование словаря

- Передача последовательности пар (*ключ*, *значение*) в конструктор `dict()`. 

```python
ordinal = dict([(1, 'First'), (2, 'Second'), (3, 'Third')])
print(ordinal[2])  # обратите внимание: здесь 2 - ключ, а не индекс
# Second
```
- Если ключи - простые строки (которые могут использоваться как имена переменных), то пары можно определять как именованные аргументы для конструктора `dict()`:

```python
mass = dict(Mercury=3.301e23, Venus=4.867e24, Earth=5.972e24)
print(mass['Earth'])  # 5.972e24
```
Итеративный проход в цикле `for` по словарю возвращает ключи (в порядке вставки ключей):

```python
for c in ordinal:
    print(c, ordinal[c])

# 1 First
# 2 Second
# 3 Third
```

---

# Определение и индексирование словаря

Простой словарь римских цифр:

```python
numerals = {
    'one':'I', 'two':'II', 'three':'III', 'four':'IV', 'five':'V',
    'six':'VI', 'seven':'VII', 'eight':'VIII',
    1: 'I', 2: 'II', 3: 'III', 4:'IV', 5: 'V', 6:'VI', 7:'VII', 8:'VIII'
}
for num in ['three', 'four', 'five', 'six']:
    print(numerals[num], end = ' ')  # III IV V VI

for i in range(8, 0, -1):
    print(numerals[i], end=' ')  # VIII VII VI V IV III II I
```

> - Словарь можно проиндексировать в любом порядке, независимо от порядка, в котором сохраняются ключи.
> - Ключи словаря обязательно должны быть **неповторяющимися**, однако на значения это ограничение не распространяется.

---


<style scoped>
  section {
    justify-content: center;
    font-size: 40px;
  }
  h1 {
    /* color: white; */
    padding: 0px 0px 0px 0px;
    height: auto;
    align: justify; 
  }
</style>

![bg grayscale, opacity:.3](sectionrosew.jpeg)
   


<h1>Методы словарей</h1>


<!-- # Методы словарей -->



<!-- _paginate: skip -->

---

# Метод `get()`

> Обращение к словарю по индексу с несуществующим ключом приводит к <mark>ошибке</mark>:

```python
print(mass['Pluto'])  # KeyError: 'Pluto'
```

- Можно использовать метод `get()` для извлечения значения, задавая ключ, если он существует, или некоторое значение по умолчанию, если ключ не существует. 
- Если значение по умолчанию не задано, то возвращается специальное значение `None`.

```python
print(mass.get('Pluto'))  # None
print(mass.get('Pluto', -1))  # -1
```

---

# Методы `kyes()`, `values()` и `items()`

- Методы `keys()`, `values()` и `items()` возвращают соответственно ключи, значения и пары ключ-значение (в виде кортежей) словаря.

```python
planets = mass.keys()
print(planets)  # dict_keys(['Mercury', 'Venus', 'Earth'])
for planet in planets:
    print(planet , mass[planet])

# Mercury 3.301e+23
# Venus 4.867e+24
# Earth 5.972e+24
```

> По объекту `dict_keys` можно выполнять итеративный проход любое число раз, но **невозможно** индексировать и **нельзя** выполнять операции присваивания:

```python
planets = mass.keys()
print(planets[0])  # TypeError: 'dict_keys' object is not subscriptable
```

---

# Методы `kyes()`, `values()` и `items()`

- Методы `values()` и `items()` аналогичным образом извлекают значения и элементы (пары ключ-значение) и возвращают объекты `dict_values` и `dict_items`:

<br>

```python
print(mass.values())  # dict_values ([3.301e+23, 4.867e+24, 5.972e+24])
print(mass.items())  # dict_items([('Mercury', 3.301e+23), ('Venus', 4.867e+24), ('Earth', 5.972e+24)])

for planet_data in mass.items():
    print(palnet_data)

# ('Mercury', 3.301e+23)
# ('Venus', 4.867e+24)
# ('Earth', 5.972e+24)
```

---

# Инициализация словарей

- Объединение его ключей и значений при помощи функции `zip()` с последующей передачей результата вызову `dict()`:

```python
lst1 = ['a', 'b', 'c', 'd']
lst2 = [5, 7, 9, 10, 15]  # значение 15 будет пропущено
print(zip(lst1, lst2))  # <zip object at 0x0000021751A13D80>
print(list(zip(lst1, lst2)))  # [('a', 5), ('b', 7), ('c', 9), ('d', 10)]

keys_and_values = list(zip(['a', 'b', 'c'], [1, 2, 3]))  # Упаковка ключей и значений
print(keys_and_values)  # [('a', 1), ('b', 2), ('c', 3)]

d = dict(zip(['a', 'b', 'c'], [1, 2, 3]))
print(d)  # {'a': 1, 'b': 2, 'c': 3}
```

---

# Генераторы словарей (dict comprehension)

- Генераторы словарей выполняют подразумеваемый цикл, накапливая на каждом шаге результаты «ключ: значение» и используя их для заполнения нового словаря:

```py
d = {k: v for k, v in zip(['a', 'b', 'c'], [1, 2, 3])}
print(d)  # {'a': 1, 'b': 2, 'c': 3}

d = {x: x ** 2 for x in [1, 2, 3, 4, 5]}
print(d)  # {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

d = {c: c * 5 for c in 'hello'}
print(d)  # {'h': 'hhhhh', 'e': 'eeeee', 'l': 'lllll', 'o': 'ooooo'}

fruits = {fruit.upper(): fruit + '!' for fruit in ['banana', 'orange', 'apple']}
print(fruits)  # {'BANANA': 'banana!', 'ORANGE': 'orange!', 'APPLE': 'apple!'}
```

---

# Генераторы словарей (dict comprehension)

- Генераторы словарей также удобно использовать при инициализации словарей из списка ключей, во многом подобно тому, как это можно реализовать при помощи метода `fromkeys()`:

```py
d = dict.fromkeys(['a', 'b', 'c', 'd'], ‐1) # Инициализация из ключей и значения ‐1
print(d)  # {'a': ‐1, 'b': ‐1, 'c': ‐1, 'd': ‐1}

d = {key: ‐1 for key in ['a', 'b', 'c', 'd']}
print(d)  # {'a': ‐1, 'b': ‐1, 'c': ‐1, 'd': ‐1}

d = dict.fromkeys('hello')  # Другой итерируемый объект и значение по умолчанию
print(d)  # {'h': None, 'e': None, 'l': None, 'o': None}

d = {key: None for key in 'hello'}
print(d)  # {'h': None, 'e': None, 'l': None, 'o': None}
```

---

<style scoped>
  section {
    justify-content: center;
    font-size: 40px;
  }
  h1 {
    /* color: white; */
    padding: 0px 0px 0px 0px;
    height: auto;
    align: justify; 
  }
</style>

![bg right opacity:.65](L_height.webp)
   



# Множества (set)



<!-- _paginate: skip -->

---

<style scoped>
  section {
    justify-content: center;
    font-size: 30px;
    
  }
</style>

<!-- _paginate: skip -->


![bg right grayscale:.8](contacts.jpeg)

<br>

<center>

<!-- ![w:320](TPU-logo_ver-parade-color-ru-cmyk.svg) -->
![w:280](cube_title.png)

<br>

# Благодарю за внимание!

<br>

Вячеслав Алексеевич Чузлов
к.т.н., доцент ОХИ ИШПР

</center>
