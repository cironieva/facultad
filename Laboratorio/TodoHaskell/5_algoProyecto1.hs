-- ALGORITMOS Y ESTRUCTURA DE DATOS PROYECTO 1
-- Contiene todas las funciones del enunciado, pero nada más.


-- EJERCICIO 1

-- a) esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero x = x == 0

-- b) esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo x = x > 0

-- c) esVocal :: Char -> Bool, que verifica si un caracter es una vocal en min ́uscula.

esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'


-- EJERCICIO 2

-- a) paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

-- b) sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros.

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- c) productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros.

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- d) factorial :: Int -> Int, que toma un n ́umero n y calcula n!.

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- e) Utiliz ́a la funci ́on sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de n ́umeros no vac ́ıa y calcula el valor promedio (truncado, usando divisi ́on entera).

promedio :: [Int] -> Int
promedio [] = 0
promedio xs = sumatoria xs `div` length xs


-- EJERCICIO 3

-- pertenece :: Int -> [Int] -> Bool, que verifica si un n ́umero se encuentra en una lista.

pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs


-- EJERCICIO 4

-- a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un predicado T :: a -> Bool, determina si todos los elementos de xs satisfacen el predicado T.

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

-- b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un predicado T :: a -> Bool, determina si alg ́un elemento de xs satisface el predicado T.

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

-- c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una funci ́on T :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la suma de los valores que resultan de la aplicaci ́on de T a los elementos de xs.

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

-- d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a] y una funci ́on T :: a -> Int, calcula el producto de los valores que resultan de la aplicaci ́on de T a los elementos de xs.

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t


-- EJERCICIO 5

-- Defin ́ı nuevamente la funci ́on paratodo, pero esta vez usando la funci ́on paratodo’ (sin recursi ́on ni an ́alisis por casos!).

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id


-- EJERCICIO 6

-- Utilizando las funciones del ejercicio 4, program ́a las siguientes funciones por composici ́on, sin usar recursi ́on ni an ́alisis por casos.

-- a) todosPares :: [Int] -> Bool verifica que todos los n ́umeros de una lista sean pares.

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even

-- b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe alg ́un n ́umero dentro del segundo par ́ametro que sea m ́ultiplo del primer par ́ametro.

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (\x -> x `mod` n == 0)

-- c) sumaCuadrados :: Int -> Int, dado un n ́umero no negativo n, calcula la suma de los primeros n cuadrados

sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [1..n] (^2)

-- d) Programar la fuci ́on existeDivisor::Int-> [Int] -> Bool, que dado en entero n y una lista ls , devuelve True si y solo si, existe alg ́un elemento en ls que divida a n.

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n xs = existe' xs (\x -> n `mod` x == 0) 

-- e) Utilizando la funci ́on del apartado anterior, defin ́ı la funci ́on esPrimo:: Int -> Bool, que dado un entero n, devuelve True si y solo si n es primo.

esPrimo :: Int -> Bool
esPrimo n | n == 0 || n == 1 || n == (-1) = False -- por definicion de número primo
esPrimo n = not (existeDivisor n [2..(n-1)])

-- f) ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursi ́on?

factorial' :: Int -> Int
factorial' n = productoria [1..n]

-- g) Programar la funci ́on multiplicaPrimos :: [Int] -> Int que calcula el producto de todos los n ́umeros primos de una lista.

filtraPrimos :: [Int] -> [Int] -- función auxiliar
filtraPrimos [] = []
filtraPrimos (x:xs) | esPrimo x = x : filtraPrimos xs
                    | otherwise = filtraPrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (filtraPrimos xs)

-- h) Programar la funci ́on esFib :: Int -> Bool, que dado un entero n, devuelve True si y s ́olo si n est ́a en la sucesi ́on de Fibonacci.
-- Ayuda: Realizar una funci ́on auxiliar fib :: Int -> Int que dado un n devuelva el n- ́esimo elemento de la sucesi ́on.

fib :: Int -> Int -- función auxiliar
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

listaFib :: Int -> [Int] -- función auxiliar, crea una lista con los n primeros números de fibonacci
listaFib n | n == 0 = [fib 0]
           | otherwise = listaFib (n-1) ++ [fib n]

esFib :: Int -> Bool
esFib n = existe' (listaFib (n+1)) (== n)

-- i) Utilizando la funci ́on del apartado anterior, defin ́ı la funci ́on todosFib :: [Int] -> Bool que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesi ́on de Fibonacci.

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs (\x-> esFib x)


-- EJERCICIO 8

--Program ́a una funci ́on que dada una lista de n ́umeros xs, devuelve la lista que resulta de duplicar cada valor de xs.

-- a) Definila usando recursión.

duplicar :: [Int] -> [Int]
duplicar [] = []
duplicar (x:xs) = x * 2 : duplicar xs

-- b) Definila utilizando la función map.

duplicar' :: [Int] -> [Int]
duplicar' xs = map (*2) xs


-- EJERCICIO 9

-- Program ́a una funci ́on que dada una lista de n ́umeros xs, calcula una lista que tiene como elementos aquellos n ́umeros de xs que son primos.

-- a) Definila usando recursi ́on.

filtrarPrimos :: [Int] -> [Int]
filtrarPrimos [] = []
filtrarPrimos (x:xs) | esPrimo x = x : filtrarPrimos xs
                     | otherwise = filtrarPrimos xs

-- b) Definila utilizando la funci ́on filter.

filtrarPrimos' :: [Int] -> [Int]
filtrarPrimos' xs = filter esPrimo xs

-- c) Revis ́a tu definici ́on del ejercicio 6g. ¿Se puede mejorar?

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria (filter esPrimo xs)


-- EJERCICIO 10

-- La funci ́on primIgualesA toma un valor y una lista, y calcula el tramo inicial m ́as largo de la lista cuyos elementos son iguales a ese valor.

-- a) Program ́a primIgualesA por recursi ́on.

primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x : primIgualesA n xs
                      | otherwise = []

-- b) Program ́a nuevamente la funci ́on utilizando takeWhile.

primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs


-- EJERCICIO 11

-- La funci ́on primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre s ́ı.

-- a) Program ́a primIguales por recursi ́on.

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:xs) | x == head xs = x : primIguales xs
                   | otherwise = [x]

-- b) Us ́a cualquier versi ́on de primIgualesA para programar primIguales. Est ́a permitido dividir en casos, pero no usar recursi ́on.

primIguales' :: Eq a => [a] -> [a]
primIguales' xs = primIgualesA (head xs) xs


-- EJERCICIOS ESTRELLA (*)

-- EJERCICIO 12

-- Reunir todas las funciones del ejercicio 4 en una sola función
-- cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
-- cuantGen op z xs t = ...
-- que tomando como argumento un operador op, su elemento neutro z, una lista de elementos xs y una funci ́on t ́ermino t, aplica el operador a los elementos de la lista, transformados por la funci ́on t ́ermino.

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = t x `op` cuantGen op z xs t


-- EJERCICIO 13

-- distanciaEdicion::[Char]->[Char]-> Int. La funci ́on distanciaEdicion, se comporta de la siguiente manera:
-- Si alguna de las listas es vac ́ıa, devuelve la longitud de la otra lista
-- Si las dos listas son no vac ́ıas: x:xs e y:ys, compara los primeros elementos de cada lista:
--          Si x==y, no suma y sigue computando la distancia para xs e ys ,
--          Si x!=y, suma 1 y sigue computando la distancia para xs e ys .

distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] ys = length ys
distanciaEdicion xs [] = length xs
distanciaEdicion (x:xs) (y:ys) | x == y = distanciaEdicion xs ys
                               | otherwise = 1 + distanciaEdicion xs ys


-- EJERCICIO 14

-- primQueCumplen::[a]->(a->Bool)->[a], tal que, dada una lista ls y un predicado p, devuelve el tramo inicial de ls que cumple p.

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] p = []
primQueCumplen (l:ls) p | p l = takeWhile p (l:ls)
                        | otherwise = primQueCumplen ls p