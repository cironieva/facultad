-- Fibonacci por definición recursiva

fibR 0 = 0
fibR 1 = 1
fibR n = fibR (n-2) + fibR (n-1)

-- Fibonacci por fórmula cerrada

a = (1 + sqrt 5) / 2
b = (1 - sqrt 5) / 2

fibC n = (a^n - b^n) / sqrt 5


-- Generalización
psum xs = gpsum 0 xs
gpsum _ [] = True
gpsum n (x:xs) = n >= 0 && gpsum (n+x) xs


-- Otras pruebas x

sumaHastaN 0 = 0
sumaHastaN n = n + sumaHastaN (n-1)