from random import randint, uniform
import math


def create_population(bounds, popsize, initial_guess):
    population = [[uniform(bounds[i][0], bounds[i][1])
                   for i in range(len(bounds))]
                  for _ in range(popsize)]

    if initial_guess:
        return population[:-len(initial_guess)] + initial_guess

    return population


def selection(func, population, selected, args):
    sorted_population = sorted(population,
                               key=lambda x: func(x, *args))
    return sorted_population[:selected]


def crossover(selected_pop, popsize):
    length = len(selected_pop)
    crossovered = int((popsize - length / 2)) or 1  # оператор скрещивания
    # выполнится хотябы один раз
    count = 0
    genome1, genome2 = [], []  # вспомогательные списки для смешения генотипов

    while count != crossovered:  # индексы выбираются случайным образом
        index1 = randint(0, length - 1)
        index2 = randint(0, length - 1)

        if index1 == index2:
            continue

        genome1.append(selected_pop[index1])
        genome2.append(selected_pop[index2])

        count += 1

    # граница деления генома также выбирается случайным образом
    new1 = [gen1[:(s := randint(1, len(gen1) - 1))] + gen2[s:]
            for gen1, gen2 in zip(genome1, genome2)]
    new2 = [gen1[:(s := randint(1, len(gen1) - 1))] + gen2[s:]
            for gen1, gen2 in zip(genome2, genome1)]
    new_population = selected_pop + new1 + new2

    return new_population[:popsize]


def mutate(crossed_pop, limits, m_range):
    low = 1 - (1 - limits[0]) / m_range
    high = 1 + (limits[1] - 1) / m_range
    length = len(crossed_pop)
    # особи для мутации выбираются случайным образом
    indexes = [randint(0, length - 1) for _ in range(length)]
    mutation_coeff = uniform(low, high)
    mutated = crossed_pop[:]

    for i in indexes:
        mutated[i] = [
            item * mutation_coeff for item in mutated[i]]

    return mutated


def genetic_algorithm(
        bounds, func, initial_guess=(), args=(),
        popsize=1000, selection_size=200,
        mutation_limits=(0.5, 1.2), mutation_range=1,
        generations_count=10):
    best = [None for _ in range(generations_count)]

    for generation in range(generations_count):
        mutation_decrease = (
                mutation_range + math.log(1 + generation))
        population = create_population(
            bounds, popsize, initial_guess)
        selected = selection(
            func, population, selection_size, args)
        crossed = crossover(selected, popsize)
        mutated = mutate(
            crossed, mutation_limits, mutation_decrease)
        population = mutated[:]
        best[generation], = selection(func, population, 1, args)
        initial_guess = [best[generation]]

    return selection(func, best, generations_count, args)
