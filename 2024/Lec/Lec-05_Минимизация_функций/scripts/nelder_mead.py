def nelder_mead(func, initial, alpha=1, beta=0.5, gamma=2, eps=1e-8):
    """
    Реализация метода Нелдера-Мида для поиска экстремума функций.
    :param func: <function> оптимизируемая функция
    :param initial: <list-object> начальный симплекс из n+1 точек
    :param alpha: <float> коэффициент отражения; по умолчанию alpha = 1
    :param beta: <float> коэффициент сжатия; по умолчанию beta = 0.5
    :param gamma: <float> коэффициент растяжения; по умолчанию gamma = 2
    :return: <list-object> координаты точки, при которой достигается 
                           минимум функции.
    """
    n = len(initial)
    p = initial[:]
    condition = False
    y = [func(item) for item in p]
    iteration = 1

    while not condition:
        high, low = y.index(max(y)), y.index(min(y))

        pc = []
        s = 0
        for j in range(n - 1):
            for i in range(n):
                if i != high:
                    s += p[i][j] / (n - 1)
            pc.append(s)
            s = 0

        # отражение
        pr = [(1 + alpha) * pc[i] - alpha * p[high][i] for i in range(n - 1)]
        yr = func(pr)

        if yr < y[low]:
            # растяжение
            pe = [(1 + gamma) * pr[i] - gamma * pc[i] for i in range(n - 1)]
            ye = func(pe)
            if ye < y[low]:
                p[high] = pe[:]
            else:
                p[high] = pr[:]

        elif all(yr > y[i] for i in range(n) if i != high):
            if yr <= y[high]:
                p[high] = pr[:]

            # сжатие
            ps = [beta * p[high][i] + (1 - beta) * pc[i]
                  for i in range(n - 1)]
            ys = func(ps)

            if ys > y[high]:
                p = [[(p[i][j] + p[low][j]) / 2 for j in range(n - 1)]
                       for i in range(n)]
            else:
                p[high] = ps[:]

        else:
            p[high] = pr[:]

        y = [func(item) for item in p]
        
        y_mean = sum(y) / n
        error = sum((y[i] - y_mean) ** 2 / n for i in range(n)) ** 0.5
        iteration += 1
        condition = error <= eps or iteration >= n * 200

    return p[low]
    