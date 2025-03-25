-- INTRODUCCIÓN A LOS ALGORITMOS PRÁCTICO 2
-- Contiene todas las funciones del enunciado, pero nada más.


-- EJERCICIO 3: funciones Filter

-- a) soloPares :: [Int] -> [Int], que dada una lista de enteros xs devuelve una lista sólo con los números pares contenidos en xs, en el mismo orden y con las mismas repeticiones (si las hubiera)

soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs) | x `mod` 2 == 0 = x : soloPares xs
                 | x `mod` 2 /= 0 = soloPares xs

-- b) mayoresQue10 :: [Int] -> [Int], que dada una lista de enteros xs devuelve una lista sólo con los números mayores que 10 contenidos en xs

mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs) | x > 10 = x : mayoresQue10 xs
                    | x <= 10 = mayoresQue10 xs

-- c) mayoresQue :: Int-> [Int] -> [Int], que dado un entero n y una lista de enteros xs devuelve una lista sólo con los números mayores que n contenidos en xs

mayoresQue :: Int -> [Int] -> [Int]
mayoresQue n [] = []
mayoresQue n (x:xs) | x > n = x : mayoresQue n xs
                    | x < n = mayoresQue n xs


-- EJERCICIO 4: funciones Map

-- a) sumar1 :: [Int] -> [Int], que dada una lista de enteros le suma uno a cada uno de sus elementos.

sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = x + 1 : sumar1 xs

-- b) duplica :: [Int] -> [Int], que dada una lista de enteros duplica cada uno de sus elementos.

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = x * 2 : duplica xs

-- c) multiplica :: Int-> [Int] -> [Int], que dado un número n y una lista, multiplica cada uno de los elementos por n.

multiplica :: Int -> [Int] -> [Int]
multiplica n [] = []
multiplica n (x:xs) = x * n : multiplica n xs


-- EJERCICIO 5: funciones Fold

-- a) todosMenores10 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de números menores que 10.

todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True
todosMenores10 (x:xs) = x < 10 && todosMenores10 xs

-- b) hay0 :: [Int] -> Bool, que dada una lista decide si existe algún 0 en ella.

hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs) = x == 0 || hay0 xs

-- c) sumatoria :: [Int] -> Int, que dada una lista devuelve la suma de todos sus elementos.

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs


-- EJERCICIO 6: funciones Zip

-- repartir :: [String] -> [String] -> [(String,String)] donde los elementos de la primera lista son nombres de personas y los de la segunda lista son cartas españolas es una función que devuelve una lista de pares que le asigna a cada persona una carta.

repartir :: [String] -> [String] -> [(String, String)]
repartir [] ys = []
repartir xs [] = []
repartir (x:xs) (y:ys) = (x, y) : repartir xs ys


-- EJERCICIO 7: funciones Unzip

-- apellidos :: [(String, String, Int)] -> [String] que toma una lista de ternas donde el primer elemento representa el nombre de un alumno, el segundo el apellido, y el tercero la edad, y devuelve la lista de todos los apellidos de los alumnos

apellidos :: [(String, String, Int)] -> [String]
apellidos [] = []
apellidos ((nombre, apellido, edad): xs) = apellido : apellidos xs


-- EJERCICIO 8

-- Definí recursivamente los operadores básicos de listas: length, !!, take, drop, ++. Para los operadores take y drop deberás hacer recursión en ambos parámetros, en el parámetro lista y en el parámetro numérico.

-- length (largo)

largo :: [a] -> Int
largo [] = 0
largo (x:xs) = 1 + largo xs

-- !! (indexar)

indexar :: [a] -> Int -> a
indexar (x:xs) 0  = x
indexar (x:xs) n = indexar xs (n-1)

-- take (tomar)

tomar :: Int -> [a] -> [a]
tomar 0 xs = []
tomar n [] = []
tomar n (x:xs) = x : tomar (n-1) xs

-- drop (tirar)

soltar :: Int -> [a] -> [a]
soltar 0 xs = xs
soltar n [] = []
soltar n (x:xs) = soltar (n-1) xs

-- ++ (concatenar)

concatenar :: [a] -> [a] -> [a]
concatenar [] ys = ys
concatenar (x:xs) ys = x : concatenar xs ys


-- EJERCICIO 9

-- a) maximo :: [Int] -> Int, que calcula el máximo elemento de una lista de enteros

maximo :: [Int] -> Int -- tipo Fold (maximo)
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

-- b) sumaPares :: [(Int, Int)] -> Int, que dada una lista de pares de números, devuelve la sumatoria de todos los números de todos los pares.

sumaPares :: [(Int, Int)] -> Int -- tipo Fold (sumatoria)
sumaPares [] = 0
sumaPares ((a,b): xs) = a + b + sumaPares xs

-- c) todos0y1 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de 0s y 1s.

todos0y1 :: [Int] -> Bool -- tipo Fold (paraTodo)
todos0y1 [] = True
todos0y1 (x:xs) = (x == 0 || x == 1) && todos0y1 xs

-- d) quitar0s :: [Int] -> [Int] que dada una lista de enteros devuelve la lista pero quitando todos los ceros.

quitar0s :: [Int] -> [Int] -- tipo Filter
quitar0s [] = []
quitar0s (x:xs) | x /= 0 = x : quitar0s xs
                | x == 0 = quitar0s xs

-- e) ultimo :: [a] -> a, que devuelve el último elemento de una lista.

ultimo :: [a] -> a
ultimo [x] = x
ultimo (x:xs) = ultimo xs

-- f) repetir :: Int-> Int-> [Int], que dado un número n mayor o igual a 0 y un número k arbitrario construye una lista donde k aparece repetido n veces.

repetir :: Int -> Int -> [Int]
repetir 0 k = []
repetir n k | n >= 0 = k : repetir (n-1) k

-- g) concat' :: [[a]] -> [a] que toma una lista de listas y devuelve la concatenación de todas ellas.
concat' :: [[a]] -> [a] -- tipo Fold
concat' [] = []
concat' (x:xs) = x ++ concat xs

-- h) rev :: [a] -> [a] que toma una lista y devuelve una lista con los mismos elementos pero en orden inverso.
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]


-- EJERCICIO 20

-- a) listasIguales :: [a] -> [a] -> Bool, que determina si dos listas son iguales, es decir, contienen los mismos elementos en las mismas posiciones respectivamente.

listasIguales :: Eq a => [a] -> [a] -> Bool -- tipo Fold
listasIguales [] [] = True
listasIguales [] ys = False
listasIguales xs [] = False
listasIguales (x:xs) (y:ys) = x == y && listasIguales xs ys

-- b) mejorNota :: [(String,Int,Int,Int)] -> [(String,Int)], que selecciona la nota más alta de cada alumno.

mejorNota :: [(String, Int, Int, Int)] -> [(String, Int)] -- tipo Unzip
mejorNota [] = []
mejorNota ((nombre, nota1, nota2, nota3): xs) = (nombre, max nota1 (max nota2 nota3)) : mejorNota xs

-- c) incPrim :: [(Int, Int)] -> [(Int,Int)], que dada una lista de pares de enteros, le suma 1 al primer número de cada par

incPrim :: [(Int, Int)] -> [(Int, Int)] -- tipo Map
incPrim [] = []
incPrim ((a,b): xs) = (a+1, b) : incPrim xs

-- d) expandir :: String-> String, pone espacios entre cada letra de una palabra. Por ejemplo: expandir "hola" = "h o l a" (sin espacio al final!).

expandir :: String -> String -- tipo Map
expandir [x] = [x]
expandir (x:xs) = x : " " ++ expandir xs


-- EJERCICIO 21

-- Contamos con una base de datos de películas representada con una lista de tuplas. Cada tupla contiene la siguiente información:
-- (⟨Nombre de la película⟩, ⟨Año de estreno⟩, ⟨Duración de la película⟩, ⟨Nombre del director⟩)
-- Observamos entonces que el tipo de la tupla que representa cada película es (String, Int, Int, String)

-- a) verTodas :: [(String, Int, Int, String)] -> Int que dada una lista de películas devuelva el tiempo que tardaría en verlas a todas.

verTodas :: [(String, Int, Int, String)] -> Int
verTodas [] = 0
verTodas ((nombre, año, duracion, director): xs) = duracion + verTodas xs

-- b) estrenos :: [(String, Int, Int, String)] -> [String] que dada una lista de películas devuelva el listado de películas que estrenaron en 2023.

estrenos :: [(String, Int, Int, String)] -> [String]
estrenos [] = []
estrenos ((nombre, año, duracion, director): xs) | año == 2023 = nombre : estrenos xs
estrenos ((nombre, año, duracion, director): xs) | año /= 2023 = estrenos xs

-- c) filmografia :: [(String, Int, Int, String)] -> String-> [String] que dada una lista de películas y el nombre de un director, devuelva el listado de películas de ese director.

filmografia :: [(String, Int, Int, String)] -> String -> [String]
filmografia [] d = []
filmografia ((nombre, año, duracion, director): xs) d | d == director = nombre : filmografia xs d
filmografia ((nombre, año, duracion, director): xs) d | d /= director = filmografia xs d


-- EJERCICIO 22

-- Una empresa de venta de computadoras está desarrollando un sistema para llevar registro de ventas. Para ello cuenta con la siguiente información:

-- Lista de los vendedores de la empresa

vendedores = ["Martin", "Diego", "Claudio", "José"]

-- Lista de ventas de la forma (fecha, nombre vendedor, lista de componentes de la máquina.
-- La fecha es una tupla de la forma (día, mes, año) y los componentes son Strings.

ventas :: [((Int, Int, Int), String, [String])]
ventas =
    [
        ((1,2,2006), "Martin", ["Monitor GPRS 3000", "Motherboard ASUS 1500"]),
        ((1,2,2006), "Diego", ["Monitor ASC 543", "Motherboard Pindorcho"]),
        ((10,2,2006), "Martin", ["Monitor ASC 543", "Motherboard ASUS 1200"]),
        ((12,2,2006), "Diego", ["Monitor GPRS 3000", "Motherboard ASUS 1200"]),
        ((4,3,2006), "Diego", ["Monitor GPRS 3000", "Motherboard ASUS 1500"])
    ]



-- Lista de precios de los componentes, de la forma (nombre componente, precio).

precios =
    [
        ("Monitor GPRS 3000", 200),
        ("Motherboard ASUS 1500", 120),
        ("Monitor ASC 543", 250),
        ("Motherboard ASUS 1200", 100),
        ("Motherboard Pindorcho", 30)
    ]


-- a) precioMaquina, recibe una lista de componentes, devuelve el precio de la máquina que se puede armar con esos componentes, que es la suma de los precios de cada componente incluido.

-- auxiliar, recibe un componente y una lista de componentes con sus precios, devuelve el precio del componente buscado.
buscaPrecio :: String -> [(String, Int)] -> Int
buscaPrecio componente ((nombre, precio): xs) | componente == nombre = precio
                                              | componente /= nombre = buscaPrecio componente xs

-- función en sí, aplica auxiliar a la lista de precios
precioMaquina :: [String] -> Int
precioMaquina [] = 0
precioMaquina (x:xs) = buscaPrecio x precios + precioMaquina xs


-- b) cantVentasComponente, recibe un componente y devuelve la cantidad de veces que fue vendido, o sea que formó parte de una máquina que se vendió.

-- auxiliar 1, devuelve la cantidad de veces que el componente aparece en la lista.
cuentaComponente :: String -> [String] -> Int
cuentaComponente componente [] = 0
cuentaComponente componente (x:xs)
    | componente == x = 1 + cuentaComponente componente xs
    | componente /= x = cuentaComponente componente xs

-- auxliar 2, aplica la auxiliar 1 a todas las listas de ventas
cantVentasComponenteAux :: String -> [((Int, Int, Int), String, [String])] -> Int
cantVentasComponenteAux componente [] = 0
cantVentasComponenteAux componente ((fecha, vendedor, componentes): xs) =
    cuentaComponente componente componentes + cantVentasComponenteAux componente xs

-- función en sí, que aplica auxiliar 2 a la lista ventas
cantVentasComponente :: String -> Int
cantVentasComponente componente = cantVentasComponenteAux componente ventas


-- c) vendedorDelMes, se le pasa un par que representa (mes,año) y devuelve el nombre del vendedor que más vendió en plata en el mes. O sea, no cantidad de ventas, sino importe total de las ventas. El importe de una venta es el que indica la función precioMaquina.

-- auxiliar 1, que suma las ventas de un vendedor en un mes y año dados
ventasVendedorMes :: String -> (Int, Int) -> [((Int, Int, Int), String, [String])] -> Int
ventasVendedorMes vendedor fecha [] = 0
ventasVendedorMes vendedor (mes, año) (((diaVenta, mesVenta, añoVenta), vendedorVenta, componentes):xs)
    | vendedor == vendedorVenta && mes == mesVenta && año == añoVenta = precioMaquina componentes + ventasVendedorMes vendedor (mes, año) xs
    | vendedor /= vendedorVenta || mes /= mesVenta || año /= añoVenta = ventasVendedorMes vendedor (mes, año) xs

-- auxiliar 2, que encuentra el vendedor con las ventas más altas en un mes y año dados
vendedorMasVentas :: (Int, Int) -> [String] -> [((Int, Int, Int), String, [String])] -> String
vendedorMasVentas fecha [] ventas = ""
vendedorMasVentas fecha (vendedor:xs) ventas
    | ventasVendedorMes vendedor fecha ventas >= ventasVendedorMes (head xs) fecha ventas = vendedor
    | ventasVendedorMes vendedor fecha ventas < ventasVendedorMes (head xs) fecha ventas = vendedorMasVentas fecha xs ventas

-- función en sí, que aplica auxiliar 2 a la lista de vendedores
vendedorDelMes :: (Int, Int) -> String
vendedorDelMes fecha = vendedorMasVentas fecha vendedores ventas


-- d) Obtener las ventas de un mes, de forma que:

-- auxiliar, que suma las ventas en un mes y año dados
ventasMesAux :: (Int, Int) -> [((Int, Int, Int), String, [String])] -> Int
ventasMesAux fecha [] = 0
ventasMesAux (mes, año) (((diaVenta, mesVenta, añoVenta), vendedorVenta, componentes):xs)
    | mes == mesVenta && año == añoVenta = precioMaquina componentes + ventasMesAux (mes, año) xs
    | mes /= mesVenta || año /= añoVenta = ventasMesAux (mes, año) xs

-- función en sí, que aplica auxiliar a la lista de ventas
ventasMes :: (Int, Int) -> Int
ventasMes fecha = ventasMesAux fecha ventas


-- e) Obtener las ventas totales realizadas por un vendedor sin límite de fecha.

-- auxiliar, que suma las ventas de un vendedor
ventasVendedorAux :: String -> [((Int, Int, Int), String, [String])] -> Int
ventasVendedorAux vendedor [] = 0
ventasVendedorAux vendedor (((diaVenta, mesVenta, añoVenta), vendedorVenta, componentes):xs)
    | vendedor == vendedorVenta = precioMaquina componentes + ventasVendedorAux vendedor xs
    | vendedor /= vendedorVenta = ventasVendedorAux vendedor xs

-- función en sí, que aplica auxiliar a la lista de ventas
ventasVendedor :: String -> Int
ventasVendedor vendedor = ventasVendedorAux vendedor ventas


-- f) huboVentas que indica si hubo ventas en un mes y año determinados. Por ejemplo: huboVentas (1, 2006) = False

-- auxiliar, que verifica si hubo ventas en un mes y año dados
huboVentasAux :: (Int, Int) -> [((Int, Int, Int), String, [String])] -> Bool
huboVentasAux fecha [] = False
huboVentasAux (mes, año) (((diaVenta, mesVenta, añoVenta), vendedorVenta, componentes):xs)
    | mes == mesVenta && año == añoVenta = True
    | mes /= mesVenta || año /= añoVenta = huboVentasAux (mes, año) xs

-- función en sí, que aplica auxiliar a la lista de ventas
huboVentas :: (Int, Int) -> Bool
huboVentas fecha = huboVentasAux fecha ventas