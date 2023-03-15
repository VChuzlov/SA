def rk(func, x0, xf, y0, h, args=()):
    count = int((xf - x0) / h) + 1
    y = [y0[:]]
    x = x0

    for i in range(1, count):
        k1 = func(x, y[i-1], *args)
        k2 = func(x + h / 2, [y + k * h / 2 for y, k in zip(y[i-1], k1)], *args)
        k3 = func(x + h / 2, [y + k * h / 2 for y, k in zip(y[i-1], k2)], *args)
        k4 = func(x + h, [y + k * h for y, k in zip(y[i-1], k3)], *args)
        
        y.append([])

        for j in range(len(y0)):
            y[i].append(y[i-1][j] + h / 6 * (k1[j] + 2 * k2[j] + 2 * k3[j] + k4[j]))
        
        x += h

    return y


def eiler(func, x0, xf, y0, h, args=()):
    count = int((xf - x0) / h) + 1
    y = [y0[:]]
    x = x0

    for i in range(1, count):
        right_parts = func(x, y[i-1], *args)
        y.append([])

        for j in range(len(y0)):
            y[i].append(y[i-1][j] + h * right_parts[j])

        x += h

    return y

