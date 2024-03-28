from mixing import mixing


if __name__ == '__main__':
    mf1 = [
        .1, .1, .1, .4, .2, .05, .03, .02
    ]
    mf2 = [
        .1, .2, .1, .3, .1, .15, .03, .02
    ]
    mf3 = [
        .1, .1, .15, .35, .1, .05, .08, .07
    ]
    
    flow_rates = [200, 250, 120]

    new_flow_rate, new_composition = mixing(
        flow_rates, [mf1, mf2, mf3]
    )
    print(f'Массовый расход смеси: {new_flow_rate}')
    for v in new_composition:
        print(f'{v:6.4f}')
    print(f'Сумма массовых долей: {sum(new_composition):6.4f}')