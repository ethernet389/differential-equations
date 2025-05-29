import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Определяем функции x(t), y(t), z(t)
def x(t, C1, C2, C3):
    return C1 * np.exp(t) + C2 * np.exp(2 * t) - C3 * np.exp(-t)

def y(t, C1, C3):
    return C1 * np.exp(t) + 3 * C3 * np.exp(-t)

def z(t, C1, C2, C3):
    return C1 * np.exp(t) + C2 * np.exp(2 * t) + 5 * C3 * np.exp(-t)

# Создаем массив значений t
t = np.linspace(-10, 10, 100)

# Создаем сетку для поверхности
T1, T2 = np.meshgrid(t, t)

# Параметры для нескольких поверхностей
params = [
    (3, 6, 9),   # C1, C2, C3 для третьей поверхности
    (3, 3, 3),
    (6, 6, 6),
]

# Создаем 3D график
fig = plt.figure(figsize=(12, 10))
ax = fig.add_subplot(111, projection='3d')

# Рисуем поверхности с разными параметрами
colors = ['viridis', 'plasma', 'inferno']  # Цветовые карты для каждой поверхности

for i, (C1, C2, C3) in enumerate(params):
    X = x(T1, C1, C2, C3)
    Y = y(T1, C1, C3)
    Z = z(T2, C1, C2, C3)

    # Рисуем поверхность с заданной цветовой картой
    ax.plot_surface(X, Y, Z, alpha=0.5, cmap=colors[i], label=f'Surface {i+1}')

# Настройки графика
ax.set_xlabel('X(t)')
ax.set_ylabel('Y(t)')
ax.set_zlabel('Z(t)')
# ax.set_title('Integral Surfaces with Different Parameters')

plt.savefig('integral_curves_3d_system.png', dpi=300, bbox_inches='tight')

# Показываем график
plt.show()

