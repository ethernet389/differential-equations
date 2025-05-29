import numpy as np
import matplotlib.pyplot as plt
from matplotlib.transforms import offset_copy
from itertools import combinations_with_replacement as cwr

def y(x, C0, C1):
    return (-4*x + C0) * np.cos(4*x) + (np.log(abs(np.sin(4*x))) + C1) * np.sin(4*x)

# Создаем массив значений x с увеличенным диапазоном
x = np.linspace(-10, 10, 1000)  # От -5 до 5 с 1000 точками

constants = list(cwr(range(-3, 4), r=2))

# Создаем график размером 20x20 дюймов
plt.figure(figsize=(20, 20))
# plt.title('Интегральные кривые дифференциального уравнения', fontsize=20, pad=20)
plt.xlabel('x', fontsize=25)
plt.ylabel('y(x)', fontsize=25)
plt.grid(True, which='both', linestyle='--', alpha=0.6)

# Устанавливаем широкие пределы осей
plt.xlim(-5, 5)
plt.ylim(-50, 50)

# Цветовая палитра
colors = plt.cm.tab10(np.linspace(0, 1, len(constants)))

# Рисуем кривые
for i, (C0, C1) in enumerate(constants):
    # label = f'C₀={C0:.2f}, C₁={C1:.2f}, C₂={C2:.2f}'
    plt.plot(x, y(x, C0, C1), 
             linewidth=3,
             color=colors[i],
             linestyle='-')

# Настраиваем легенду
# plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', fontsize=12)

# Добавляем оси координат
plt.axhline(0, color='black', linewidth=1)
plt.axvline(0, color='black', linewidth=1)

# Настраиваем шкалу
plt.xticks(np.arange(-5, 6, 1), fontsize=20)
plt.yticks(np.arange(-50, 55, 5), fontsize=20)

# Включаем дополнительную сетку
plt.minorticks_on()
plt.grid(which='minor', linestyle=':', alpha=0.3)

# Сохраняем график в файл высокого качества
plt.savefig('integral_curves_large.png', dpi=300, bbox_inches='tight')

plt.show()