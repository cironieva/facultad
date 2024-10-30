-- LAS PARTES QUE SOBRAN

-- Implementa el tipo Carrera como esta definido arriba.

data Carrera = Matematica | Fisica | Computacion | Astronomia


-- titulo :: Carrera -> String que devuelve el nombre completo de la carrera en forma de string.

titulo :: Carrera -> String
titulo Matematica  = "Licenciatura en Matematica"
titulo Fisica      = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia  = "Licenciatura en Astronomia"

-- *Main> titulo Matematica 
-- "Licenciatura en Matematica"

-- *Main> titulo Fisica
-- "Licenciatura en Fisica"


-- Definir usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera recursiva) cual es el menor valor de una lista de tipo [a]. Asegurarse que solo este definida para listas no vacıas.

minimoElemento :: Ord a => [a] -> a
minimoElemento [x]    = x
minimoElemento (x:xs) = min x (minimoElemento xs)

-- *Main> minimoElemento [3,1,2]
-- 1

-- *Main> minimoElemento []
-- *** Exception: 1_parte1.hs:(22,1)-(23,49): Non-exhaustive patterns in function minimoElemento


-- Definir la funcion minimoElemento’ de manera tal que el caso base de la recursion sea el de la lista vacıa. Para ello revisar la clase Bounded.

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' []     = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

-- *Main> minimoElemento' [3,1,2]::Int
-- 1

-- *Main> minimoElemento' []::Int
-- 9223372036854775807                              (esta es la cota superior del tipo Int)


-- Definir la funcion primerElemento que devuelve el primer elemento de una lista no vacıa, o Nothing si la lista es vacıa.

primerElemento :: [a] -> Maybe a
primerElemento []    = Nothing
primerElemento (x:_) = Just x

-- *Main> primerElemento [3,1,2]
-- Just 3

-- *Main> primerElemento []
-- Nothing