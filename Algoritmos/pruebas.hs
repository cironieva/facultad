-- Fibonacci por definición recursiva

fibR 0 = 0
fibR 1 = 1
fibR n = fibR (n-2) + fibR (n-1)

-- Fibonacci por fórmula cerrada

a = (1 + sqrt 5) / 2
b = (1 - sqrt 5) / 2

fibC n = (a^n - b^n) / sqrt 5


-- Generalización

p xs = q 0 xs
q _ [] = True
q n (x:xs) = n >= 0 && q (n+x) xs