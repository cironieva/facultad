-- INTRODUCCIÓN A LOS ALGORITMOS PRÁCTICO 1
-- Contiene todas las funciones del enunciado, pero nada más.


--  EJERCICIO 13

-- a) f, que toma un número x y lo multiplica por 5

f :: Int -> Int
f x = 5 * x

-- b) duplica, que toma un número a y lo suma a sí mismo

duplica :: Int -> Int
duplica a = a + a

-- c) por2, que toma un número y lo lo multiplica por dos

por2 :: Int -> Int
por2 y = 2 * y

-- d) multiplicar, que toma un número zz y un número tt y los multiplica entre sí

multiplicar :: Int -> Int -> Int
multiplicar zz tt = zz * tt


-- EJERCICIO 14

-- toma dos valores y calcula su promedio

promedio :: Float -> Float -> Float
promedio x y = (x + y) / 2


-- EJERCICIO 18

-- ejemplo dado: sgn, que toma un número x y devuelve 1 si x es positivo, -1 si x es negativo y 0 si x es 0 

sgn :: Int -> Int
sgn x | x > 0 = 1
      | x < 0 = -1
      | x == 0 = 0

-- a) entre0y9 : Int → Bool, que dado un entero devuelve True si el entero se encuentra entre 0 y 9.

entre0y9 :: Int -> Bool
entre0y9 x = 0 < x && x < 9

-- b) rangoPrecio : Int → String, que dado un n´umero que representa el precio de una computadora, retorne “muy barato” si el precio es menor a 2000, “demasiado caro” si el precio es mayor que 5000, “hay que verlo bien” si el precio est´a entre 2000 y 5000, y “esto no puede ser!” si el precio es negativo.

rangoPrecio :: Int -> String
rangoPrecio x | x < 0 = "esto no puede ser!"
              | x < 2000 = "muy barato"
              | x <= 5000 = "hay que verlo bien"
              | x > 5000 = "demasiado caro"

-- c) absoluto : Int → Int, que dado un entero retorne su valor absoluto.

absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | x < 0 = -x

-- d) esMultiplo2 : Int → Bool, que dado un entero n devuelve True si n es m´ultiplo de 2. Usar mod.

esMultiplo2 :: Int -> Bool
esMultiplo2 x = x `mod` 2 == 0


-- EJERCICIO 19

-- esMultiploDe : Int→ Int→ Bool, que devuelve True si el segundo es m´ultiplo del primero.

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = y `mod` x == 0


-- EJERCICIO 2O

-- esBisiesto: Int→ Bool, que indica si un a˜no es bisiesto. Un a˜no es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100.

esBisiesto :: Int -> Bool
esBisiesto x = x `mod` 400 == 0 || x `mod` 4 == 0 && x `mod` 100 /= 0


-- EJERCICIO 21

-- dispersion : Int→ Int→ Int→ Int, que toma los tres valores y devuelve la diferencia entre el m´as alto y el m´as bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de dos elementos. De esa forma se puede definir dispersi´on sin escribir ninguna guarda

dispersion :: Int -> Int -> Int -> Int
dispersion x y z = max x (max y z) - min x (min y z)


-- EJERCICIO 22

-- celsiusToFahr : Float→ Float, pasa una temperatura en grados Celsius a grados Fahrenheit. Para realizar la conversi´on hay que multiplicar por 1.8 y sumar 32.

celsiusToFahr :: Float -> Float
celsiusToFahr x = x * 1.8 + 32


-- EJERCICIO 23

-- fahrToCelsius : Float→ Float, la inversa de la anterior. Para realizar la conversi´on hay que primero restar 32 y despu´es dividir por 1.8

fahrToCelsius :: Float -> Float
fahrToCelsius x = (x - 32) / 1.8


-- EJERCICIO 24

-- haceFrioF : Float→ Bool, indica si una temperatura expresada en grados Fahrenheit es fr´ıa. Decimos que hace fr´ıo si la temperatura es menor a 8 grados Celsius.

haceFrioF :: Float -> Bool
haceFrioF x = fahrToCelsius x < 8


-- TUPLAS

-- ejemplo dado: sumaPares, que toma dos pares de números y los suma coordenada a coordenada

sumaPares :: (Int, Int) -> (Int, Int) -> (Int, Int)
sumaPares (a,b) (c,d) = (a+c, b+d)


-- EJERCICIO 25

-- a) segundo3 : (Int, Int, Int) → Int, que dada una terna de enteros devuelve su segundo elemento.

segundo3 :: (Int, Int, Int) -> Int
segundo3 (a, b, c) = b

-- b) ordena : (Int, Int) → (Int, Int), que dados dos enteros los ordena de menor a mayor.

ordena :: (Int, Int) -> (Int, Int)
ordena (a, b) = (max a b, min a b)

-- c) rangoPrecioParametrizado : Int → (Int, Int) → String que dado un n´umero x, que representa el precio de un producto, y un par (menor, mayor) que represente el rango de precios que uno espera encontrar, retorne “muy barato” si x est´a por debajo del rango, “demasiado caro” si est´a por arriba del rango, “hay que verlo bien” si el precio est´a en el rango, y “esto no puede ser!” si x es negativo

rangoPrecioParametrizado :: Int -> (Int, Int) -> String
rangoPrecioParametrizado x (menor, mayor) | x < 0 = "esto no puede ser!"
                                          | x < menor = "muy barato"
                                          | x <= mayor = "hay que verlo bien"
                                          | x > mayor = "demasiado caro"

-- d) mayor3 : (Int, Int, Int) → (Bool, Bool, Bool), que dada una una terna de enteros devuelve una terna de valores booleanos que indica si cada uno de los enteros es mayor que 3.

mayor3 :: (Int, Int, Int) -> (Bool, Bool, Bool)
mayor3 (a, b, c) = (a>3, b>3, c>3)

-- e) todosIguales : (Int, Int, Int) → Bool que dada una terna de enteros devuelva True si todos sus elementos son iguales y False en caso contrario.

todosIguales :: (Int, Int, Int) -> Bool
todosIguales (a, b, c) = a == b && b == c