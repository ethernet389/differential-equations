// Preambule
#show math.equation: set text(16pt)
#show figure.where(kind: "image"): set figure(supplement: [Рис.])

#set page(
  paper: "a4",
  numbering: "1",
  margin: (x: 1.8cm, y: 1.5cm),
)

#set text(
  font: "New Computer Modern",
  size: 16pt
)

// Title
#align(center + horizon,
    text(20pt)[*Расчётно-графическая работа по специальным разделам высшей математики*]
)
#align(center + horizon, text[
  *Вариант 16*

  Выполнил: М3101 Симаков Глеб Дмитриевич
]).

#align(center + horizon,
  image("logo.png", width: 50%)
)

#pagebreak()

// First part
= Часть I

_Условие_:

Привести к каноническому виду уравнение поверхности второго порядка
с помощью теории квадратичных форм.

$
2x^2 + 4y^2 + 2z^2 + 2x z - 12 = 0
$

_Решение_:

Запишем матрицу квадратичной формы, 
она же будет матрицей линейного оператора $cal(A)$:
$
A = mat(
  2, 0, 1;
  0, 4, 0;
  1, 0, 2;
)
$

Решим вековое уравнение для матрицы $A$:
$
|A - lambda cal(I)| = 0 <=> 

mat(
  delim: "|",
  2 - lambda, 0, 1;
  0, 4 - lambda, 0;
  1, 0, 2 - lambda;
) = 0
$

$
(4 - lambda)((2 - lambda)^2 - 1) = 0
#linebreak()
(lambda - 4)(lambda - 1)(lambda - 3) = 0
#linebreak()
lambda in {1, 3, 4}
$

Получили собственные числа для оператора $cal(A)$, 
теперь найдём собственные векторы для каждого из чисел:

#let stroke-line = line(length: 100%, stroke: (dash: "dashed"))

#stroke-line

$lambda_1 = 1:$

$
(A - cal(I))x = 0 <=>

mat(
  1, 0, 1;
  0, 3, 0;
  1, 0, 1;
) ~ 

cases(
  x_1 = -x_3,
  x_2 = 0,
  x_3 in RR
) => 

gamma_1 = vec(1, 0, -1) => gamma_1^o = 1/sqrt(2) vec(1, 0, -1)
$

#pagebreak()
#stroke-line

$lambda_2 = 3:$

$
(A - 3cal(I))x = 0 <=>

mat(
  -1, 0, 1;
  0, 1, 0;
  1, 0, -1;
) ~ 

cases(
  x_1 = x_3,
  x_2 = 0,
  x_3 in RR
) => 

gamma_2 = vec(1, 0, 1) => gamma_2^o = 1/sqrt(2) vec(1, 0, 1)
$

#stroke-line

$lambda_3 = 4:$

$
(A - 4cal(I))x = 0 <=>

mat(
  -2, 0, 1;
  0, 0, 0;
  1, 0, -2;
) ~ 

cases(
  x_1 = x_3 / 2,
  x_2 in RR,
  x_1 = 2x_3
) => 

gamma_3^o = vec(0, 1, 0)
$

#stroke-line

Векторы ${gamma_1^o, gamma_2^o, gamma_3^o}$ образуют базис, 
в котором матрица A имеет диагональный вид. 
Это означает, что в таком базисе квадратичная форма имеет канонический вид 
$a_00x^2 + a_11y^2 + a_22z^2 + c = 0$

Составим правую тройку векторов ${gamma_1^o, gamma_2^o, gamma_3^o}$
$
Gamma = (gamma_1^o, gamma_2^o, gamma_3^o) = 

mat(
  1/sqrt(2), 0, 1/sqrt(2);
  0, 1, 0;
  -1/sqrt(2), 0, -1/sqrt(2);
)
$

$
det(Gamma) = mat(
  delim: "|",
  1/sqrt(2), 1/sqrt(2);
  -1/sqrt(2), 1/sqrt(2);
) = 1 => Gamma - "правая тройка"
$

Теперь перейдём от старого базиса к базису из собственных векторов:
$
vec(x, y, z) = Gamma vec(x', y', z') => 

cases(
  x = 1/sqrt(2)x' + 1/sqrt(2)z',
  y = y',
  z = -1/sqrt(2)x' + 1/sqrt(2)z'
)
$

Действие оператора $Gamma$: Поворот вокруг оси $O y$ на $pi/4$.

$
A_Gamma = mat(
  1, 0, 0;
  0, 3, 0;
  0, 0, 4;
) - "матрица" A "в базисе" Gamma
$

Канонический вид уравнения:
$
4z'^2 + 3y'^2 + x'^2 - 12 = 0
$


#grid(
  columns: 2,
  figure(
    image("part1_not_canon.png"),
    kind: "image",
    caption: [Форма до канонизации]
  ),
  figure(
    image("part1_canon.png"),
    kind: "image",
    caption: [Форма после канонизации]
  ),
)

#box(stroke: black, outset: (x: 5pt, y: 5pt))[
  _Ответ:_ $4z^2 + 3y^2 + x^2 - 12 = 0$
]



#line(length: 100%)

= Часть II

== Задание 1

_Условие_:



а) Найти решение задачи Коши методом неопределённых коэффициентов:

$
y''' + y'' - 2y' = x^2 + x + e^(2x), space y(0) = 0, 
space y'(0) = 0, space y''(0) = 0
$

б) Найти общее решение методом Лагранжа:

$
y'' + 16y = 16/(sin 4x)
$

#line(length: 100%)

_Решение пункта a_:

Найдём общее решение $accent(y, macron)$ 
линейного однородного дифферениального уравнения (ЛОДУ):
$
y''' + y'' - 2y' = 0
$

Найдём корни характеристического уравнения:
$
lambda^3 + lambda^2 - 2lambda = 0 <=>
lambda(lambda^2 + lambda - 2) = 0 <=>
lambda(lambda - 1)(lambda + 2) = 0 =>
cases(
  delim: "[",
  lambda_0 = -2,
  lambda_1 = 0,
  lambda_2 = 1
)
$

Составим общее решение ЛОДУ по полученным корням:
$
accent(y, macron) = C_0e^(-2x) + C_1e^(x) + C_2
$

Теперь найдём частное решение $accent(y, circle)$
линейного неоднородного дифферениального уравнения (ЛНДУ).

Правая часть ЛНДУ состоит из двух функций специального вида 
$x^r e^(alpha x)(P_(n)(x)cos beta x + Q_(m)(x)sin beta x)$.
Составим частное решение с неопределёнными коэффициентами:

1. $x^2 + x space 
    (
    alpha = 0, 
    space beta = 0, 
    space r = 1 
    space (lambda_1 = alpha), 
    space P_(2)(x) = x^2 + x
    )$
  - $accent(y, circle)_1 = x(A x^2 + B x + C)$

2. $e^(2x) space
    (
    alpha = 2,
    space beta = 0,
    space r = 0,
    space P_(0)(x) = 0
    )$
  - $accent(y, circle)_2 = D e^(2x)$

Частное решение имеет вид: 
$
accent(y, circle) = 
accent(y_1, circle) + accent(y_2, circle) = 
x(A x^2 + B x + C) + D e^(2x) = A x^3 + B x^2 + C x + D e^(2x)
$

Найдём коэффициенты:
$
accent(y, circle)' = 3A x^2 + 2B x + C + 2D e^(2x)
#linebreak()

accent(y, circle)'' = 6A x + 2B + 4D e^(2x)
#linebreak()

accent(y, circle)''' = 6A + 8D e^(2x)
#linebreak()
$

#stroke-line

$
(6A + 8D e^(2x)) + (6A x + 2B + 4D e^(2x)) - 2(3A x^2 + 2B x + C + 2D e^(2x)) = 

#linebreak() 
= x^2 + x + e^(2x) <=>

#linebreak()
<=> (-6A)x^2 + (6A - 4B)x + (8D)e^(2x) + (6A+ 2B - 2C) = x^2 + x + e^(2x) =>

#linebreak()
=> 
cases(
  -6A = 1,
  6A - 4B = 1,
  8D = 1,
  6A +2B -2C = 0
)
=>
cases(
  A = -1/6,
  B = -1/2,
  C = -1,
  D = 1/8
)

#linebreak()
#stroke-line
$

Подставим коэффициентов в $accent(y, circle)$:
$
accent(y, circle) = -1/6 x^3 -1/2 x^2 -x + 1/8 e^(2x)
$

Тогда решение ЛНДУ выглядит следующим образом:
#align(center)[
  #box(stroke: black, outset: (x: 5pt, y: 5pt))[
    $
    y = accent(y, macron) + accent(y, circle) = C_0e^(-2x) + C_1e^(x) + C_2 -1/6 x^3 -1/2 x^2 -x + 1/8 e^(2x)
    $
  ]
]

Решим задачу Коши:
$
y' = -2C_0 e^(-2x) + C_1 e^x -1/2 x^2 - x - 1 + 1/4 e^(2x)
$
$
y'' = 4C_0 e^(-2x) + C_1 e^x - x - 1 + 1/2 e^(2x)
$

$
cases(
  y''(0) = 0,
  y'(0) = 0,
  y(0) = 0
) <=>

cases(
  4C_0 + C_1 = 1/2,
  -2C_0 + C_1 = 3/4,
  C_0 + C_1 + C_2 = -1/8 
) =>

cases(
  C_0 = -1/24,
  C_1 = 2/3,
  C_2 = -3/4
)
$

Тогда:

$
y = 1/8 e^(2x) + 2/3 e^(x) - 1/24 e^(-2x) -1/6 x^3 -1/2 x^2 - x + 3/4
$

#figure(
  image("integral_curves_large_a.png"),
  kind: "image",
  caption: [График интегральных кривых и кривой решения]
)

#box(stroke: black, outset: (x: 10pt, y: 10pt))[
  _Ответ_:
  $y = 1/8 e^(2x) + 2/3 e^(x) - 1/24 e^(-2x) -1/6 x^3 -1/2 x^2 - x + 3/4$
]

#linebreak()

#line(length: 100%)
_Решение пункта б_:

Найдём общее решение $accent(y, macron)$ 
линейного однородного дифферениального уравнения (ЛОДУ):
$
y'' + 16 = 0
$

#linebreak()
Характеристическое уравнение:
$
lambda^2 + 16 = 0 => lambda = plus.minus 4i
$

Общее решение: $accent(y, macron) = C_1 cos 4x + C_2 sin 4x$

Найдём частное решение $accent(y, circle)$ с помощью метода Лагранжа:
$
accent(y, circle) = C_1(x) cos 4x + C_2(x) sin 4x
$

Составим условия для функций $C_1(x), C_2(x)$:
$
mat(
  cos 4x, sin 4x;
  -4 sin 4x, 4 cos 4x;
)
vec(
  C'_1,
  C'_2
)
= 
vec(
  0,
  16/(sin 4x)
)

space space space (1)
$

Вронскиан:
$
W(x) = mat( delim: "|",
  cos 4x, sin 4x;
  -4 sin 4x, 4 cos 4x;
)
= 4 cos^2 4x + 4 sin^2 4x = 4
$

$forall x in RR: W(x) != 0 => exists! "решение уравнения (1)"$

Найдём решение метод Крамера:

$
W_1(x) = mat(delim: "|",
  0, sin 4x;
  16 / (sin 4x), 4 cos 4x;
) = -16

#h(1cm)

W_2(x) = mat(delim: "|",
  cos 4x, 0;
  -4 sin 4x, 16 / (sin 4x);
) = 16 ctg 4x
$

$
C'_1(x) = (W_1(x)) / (W(x)) = -4

#h(6cm)

C'_2(x) = (W_2(x)) / (W(x)) = 4 ctg 4x
$

Решим дифференциальные уравнения для $C_1(x)$ и $C_2(x)$:

$
C_1(x) = -4x + accent(C, circle)_1

#h(4cm)

C_2 = integral ctg 4x space d (4x) = ln|sin 4x|+ accent(C, circle)_2
$

Подставим полученные функции в $accent(y, circle)$:
$
accent(y, circle) = 
(-4x + accent(C, circle)_1) cos 4x + (ln|sin 4x| + accent(C, circle)_2) sin 4x
$

Тогда общее решение выглядит следующим образом:
$
y = accent(y, macron) + accent(y, circle) = 
(-4x + accent(C, tilde)_1) cos 4x + (ln|sin 4x| + accent(C, tilde)_2) sin 4x
$

#figure(
  image("integral_curves_large_b.png"),
  kind: "image",
  caption: [Изображение некоторых интегральных кривых]
)

#box(stroke: black, outset: (x: 10pt, y: 10pt))[
  _Ответ_:
  $y(x) = (-4x + accent(C, tilde)_1) cos 4x + (ln|sin 4x| + accent(C, tilde)_2) sin 4x$
]


#linebreak()
#linebreak()

== Задание 2

_Условие_:

    Найдите общее решение системы матричным способом.
    $
    cases(
      x' = x - y + z,
      y' = x + y - z,
      z' = 2x - y
    )
    $

_Решение_:

Запишем систему в матричной форме:
$
vec(x'_t, y'_t, z'_t)
=
mat(
  1, -1, 1;
  1, 1, -1;
  2, -1, 0
)
vec(x_t, y_t, z_t) 

<=>

X'(t) = A X(t)
$

Ищем решение в виде $X(t) = Gamma e^(lambda t)$.

Найдём собственные числа для матрицы $A$:
$
|A - lambda cal(I)| = 0 

<=>

mat(delim: "|",
  1 - lambda, -1, 1;
  1, 1 - lambda, -1;
  2, -1, -lambda;
) = 0

<=>
$

$
<=>

lambda ^ 3 - 2 lambda ^ 2 - lambda + 2 = 0 =>
cases(delim: "[", lambda_1 = 1, lambda_2 = 2, lambda_3 = -1)
$

Для каждого собственного числа $lambda_i$ найдём соответствующий ему собственный вектор $Gamma_i$:

$
(A - lambda cal(I)) vec(x, y, z) = 0
$

#stroke-line

$lambda_1 = 1$:
$
(A - cal(I)) vec(x, y, z) = 0 
<=> 
mat(
  0, -1, 1;
  1, 0, -1;
  2, -1, -1;
) 
vec(x, y, z) = 0
=> 
cases(
  x = z,
  y = z,
  z in RR
)
$

Пусть $z = 1$, тогда $Gamma_1 = vec(1, 1, 1)$

#pagebreak()

#stroke-line

$lambda_2 = 2$:
$
(A - 2cal(I)) vec(x, y, z) = 0 
<=> 
mat(
  -1, -1, 1;
  1, -1, -1;
  2, -1, -2;
) 
vec(x, y, z) = 0
=> 
cases(
  x = z,
  y = 0,
  z in RR
)
$

Пусть $z = 1$, тогда $Gamma_2 = vec(1, 0, 1)$

#stroke-line

$lambda_3 = -1$:
$
(A + cal(I)) vec(x, y, z) = 0 
<=> 
mat(
  2, -1, 1;
  1, 2, -1;
  2, -1, 1;
) 
vec(x, y, z) = 0
=> 
cases(
  x = -1/5 z,
  y = 3/5 z,
  z in RR
)
$

Пусть $z = 5$, тогда $Gamma_3 = vec(-1, 3, 5)$

#stroke-line

Теперь составим общее решение системы, используя $lambda_i$ и $Gamma_i$:

$
vec(x, y, z) = limits(sum)_(i=1)^(3) C_i e^(lambda_i x) Gamma_i 

<=>

vec(x, y, z) = 
C_1 e^t vec(1, 1, 1) + C_2 e^(2t) vec(1, 0, 1) + C_3 e^(-t) vec(-1, 3, 5)
$

Запишем общее решение в виде системы:
$
  cases(
    x(t) = C_1 e^t + C_2 e^(2t) - C_3 e^(-t),
    y(t) = C_1 e^t + 3C_3 e^(-t),
    z(t) = C_1 e^t + C_2 e^(2t) + 5C_3 e^(-t)
  )
$

#figure(
  image("dif_system.png"),
  kind: "image",
  caption: [Изображение некоторых частных решений]
)

#box(stroke: black, outset: (x: 10pt, y: 10pt))[
_Ответ_:
$
  cases(
    x(t) = C_1 e^t + C_2 e^(2t) - C_3 e^(-t),
    y(t) = C_1 e^t + 3C_3 e^(-t),
    z(t) = C_1 e^t + C_2 e^(2t) + 5C_3 e^(-t)
  )
$
]