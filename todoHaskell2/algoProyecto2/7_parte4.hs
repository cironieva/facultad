-- LA PARTE DE LOS ÁRBOLES

-- EJERCICIO 9 (Punto *)

-- Otro tipo de datos muy útil y que se puede usar para representar muchas situaciones es el  ́arbol
-- En este ejercicio consideramos  ́arboles binarios, es decir que cada rama tiene s ́olo dos descendientes inmediatos:


data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a ) deriving Show


-- a) a_long :: Arbol a -> Int que dado un  ́arbol devuelve la cantidad de datos almacenados.

a_long :: Arbol a -> Int
a_long Hoja             = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

-- *Main> a_long Hoja
-- 0

-- *Main> a_long ejemploA
-- 3

-----------------------------------------------------------------------------------------------------------------------------


-- b) a_hojas :: Arbol a -> Int que dado un  ́arbol devuelve la cantidad de hojas.

a_hojas :: Arbol a -> Int
a_hojas Hoja             = 1
a_hojas (Rama izq _ der) = a_hojas izq + a_hojas der

-- *Main> a_hojas Hoja 
-- 1

-- *Main> a_hojas ejemploA
-- 4

-----------------------------------------------------------------------------------------------------------------------------


-- c) a_inc :: Num a => Arbol a -> Arbol a que dado un  ́arbol que contiene n ́umeros, los incrementa en uno.

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja             = Hoja
a_inc (Rama izq x der) = Rama (a_inc izq) (x + 1) (a_inc der)

-- fue necesario agregar deriving Show a Arbol a

-- *Main> a_inc Hoja
-- Hoja

-- *Main> a_inc ejemploA
-- Rama (Rama Hoja 11 Hoja) 3 (Rama Hoja 12 Hoja)

-----------------------------------------------------------------------------------------------------------------------------


-- d) a_map :: (a -> b) -> Arbol a -> Arbol b que dada una funci ́on y un  ́arbol, devuelve el  ́arbol con la misma estructura, que resulta de aplicar la funci ́on a cada uno de los elementos del  ́arbol. Revis ́a la definici ́on de la funci ́on anterior y reprogramala usando a_map.

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja             = Hoja
a_map f (Rama izq x der) = Rama (a_map f izq) (f x) (a_map f der)

a_inc' :: Num a => Arbol a -> Arbol a
a_inc' arbol = a_map (+1) arbol

-- *Main> a_map (*2) ejemploA
-- Rama (Rama Hoja 20 Hoja) 4 (Rama Hoja 22 Hoja)

-- *Main> a_inc' ejemploA
-- Rama (Rama Hoja 11 Hoja) 3 (Rama Hoja 12 Hoja)



-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------




-- EJERCICIO 10 (Punto *)

-- Un tipo tambi ́en muy  ́util, es el  ́arbol binario de b ́usqueda (ABB). Un ABB es una estructura de datos donde cada nodo tiene un valor y cumple con la propiedad de que los valores en el sub ́arbol izquierdo son menores que el valor del nodo, y los valores en el sub ́arbol derecho son mayores.


-- a) Definir el tipo recursivo ABB utilizando los constructores:
-- RamaABB :: ABB a -> a -> ABB a
-- VacioABB :: ABB a

data ABB a = RamaABB (ABB a) a (ABB a) | VacioABB deriving Show

-----------------------------------------------------------------------------------------------------------------------------


-- b) insertarABB :: Ord a => a -> ABB a -> ABB a que tome un valor y un  ́arbol binario como entrada y devuelva un nuevo  ́arbol que contenga el valor insertado en el  ́arbol original.

insertarABB :: Ord a => a -> ABB a -> ABB a
insertarABB x VacioABB                        = RamaABB VacioABB x VacioABB
insertarABB x (RamaABB izq y der) | x < y     = RamaABB (insertarABB x izq) y der
                                  | otherwise = RamaABB izq y (insertarABB x der)

-- fue necesario agregar deriving Show a ABB a

-- *Main> insertarABB 0 ejemplo3
-- RamaABB (RamaABB (RamaABB (RamaABB VacioABB 0 VacioABB) 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 VacioABB))

-- *Main> insertarABB 6 ejemplo3
-- RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB (RamaABB VacioABB 6 VacioABB) 8 (RamaABB VacioABB 10 VacioABB))

-----------------------------------------------------------------------------------------------------------------------------


-- c) buscarABB :: Eq a => a -> ABB a -> Bool que tome un valor y un  ́arbol binario como entrada y devuelva True si el valor est ́a presente en el  ́arbol y False en caso contrario.

buscarABB :: Ord a => a -> ABB a -> Bool
buscarABB _ VacioABB                        = False
buscarABB x (RamaABB izq y der) | x < y     = buscarABB x izq
                                | x > y     = buscarABB x der
                                | otherwise = True

-- *Main> buscarABB 3 ejemplo3
-- True

-- *Main> buscarABB 7 ejemplo3
-- False

-----------------------------------------------------------------------------------------------------------------------------


-- d) Definir la funci ́on verificarABB que devuelve True si el  ́arbol cumple con la propiedad fundamental o False en caso contrario. De manera auxiliar pueden definir las funciones:
-- mayor_a_todos :: Ord a => a -> ABB a -> Bool
-- menor_a_todos :: Ord a => a -> ABB a -> Bool

mayor_a_todos :: Ord a => a -> ABB a -> Bool -- auxiliar
mayor_a_todos _ VacioABB            = True
mayor_a_todos x (RamaABB izq y der) = x > y && mayor_a_todos x izq && mayor_a_todos x der

menor_a_todos :: Ord a => a -> ABB a -> Bool -- auxiliar
menor_a_todos _ VacioABB            = True
menor_a_todos x (RamaABB izq y der) = x < y && menor_a_todos x izq && menor_a_todos x der

verificarABB :: Ord a => ABB a -> Bool       -- función en sí
verificarABB VacioABB            = True
verificarABB (RamaABB izq y der) = menor_a_todos y der && mayor_a_todos y izq && verificarABB izq && verificarABB der

-- *Main> verificarABB ejemplo1
-- False

-- *Main> verificarABB ejemplo2
-- False

-- *Main> verificarABB ejemplo3
-- True


-----------------------------------------------------------------------------------------------------------------------------


-- Ejemplos para probar en ghci

-- Árbol binario

ejemploA :: Arbol Int
ejemploA = Rama 
            (Rama Hoja 10 Hoja) 
            2 
            (Rama Hoja 11 Hoja)



-- Árboles de búsqueda binaria ABB

ejemplo1 :: ABB Int
ejemplo1 = RamaABB 
            (RamaABB VacioABB 10 VacioABB) 
            2 
            (RamaABB VacioABB 11 VacioABB)

ejemplo2 :: ABB Int
ejemplo2 = RamaABB 
            (RamaABB 
                (RamaABB VacioABB 1 VacioABB) 
                3 
                (RamaABB VacioABB 7 VacioABB)) 
            5 
            (RamaABB 
                VacioABB 
                8 
                (RamaABB VacioABB 10 VacioABB))

ejemplo3 :: ABB Int
ejemplo3 = RamaABB 
            (RamaABB 
                (RamaABB VacioABB 1 VacioABB) 
                3 
                (RamaABB VacioABB 4 VacioABB)) 
            5 
            (RamaABB 
                VacioABB 
                8 
                (RamaABB VacioABB 10 VacioABB))
