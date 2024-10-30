-- este es el proyecto de Nahuel


--Ejercicio 1 inciso a
data Carrera = Matematica | Fisica | Computacion | Astronomia
--Ejercicio 1 inciso b
licStr = "Licenciatura en "

titulo :: Carrera -> String
titulo Matematica = licStr ++ "Matematica"
titulo Fisica = licStr ++ "Fisica"
titulo Computacion = licStr ++ "Computacion"
titulo Astronomia = licStr ++ "Astronomia"

--Ejemplos
--titulo Matematica
--"Licenciatura en Matematica"

--titulo Fisica
--"Licenciatura en Fisica"

--Ejercicio 1 inciso c

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Ord, Eq, Show)

--Ejercicio 1 inciso d 

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--Ejercicio 2 inciso a

--Do <= Re
--True

--min Fa Si
--Fa

--Ejercicio 3 inciso a

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

--Ejemplos
--minimoElemento [1,2,3]::[Int]
-- 1

--minimoElemento [Fa, La, Sol, Re, Fa]
--Re

--Ejercicio 3 inciso b

minimoElemento' :: (Ord a , Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)
--Ejemplos 
--minimoElemento' [1,2,3]::[Int]
-- 1

--Ejercicio 3 inciso c

--minimoElemento [Fa, La, Sol, Re, Fa]
--Re

--Ejercicio 4 inciso a

type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista 
                 | Ciclista Modalidad 
                 | Velocista Altura 
                 | Tenista TipoReves ManoHabil Altura 
                 | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--Ejercicio 4 inciso b

--Velocista :: Altura -> Deportista

--Ejercicio 4 inciso c
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas ((Velocista (x) ):xs) = 1 + contarVelocistas xs
contarVelocistas (z:zs) = 0 + contarVelocistas zs

--Ejemplos
--contarVelocistas [Velocista 1, Velocista 2, Velocista 3]
--3

--contarVelocistas [Velocista 1, Velocista 2, Velocista 3, Ajedrecista]
--3

--Ejercicio 4 inciso d

contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] z = 0
contarFutbolistas ((Futbolista(Arco)(x)(y)(z)):xs) Arco = 1 + contarFutbolistas xs Arco
contarFutbolistas ((Futbolista(Mediocampo)(x)(y)(z)):xs) Mediocampo = 1 + contarFutbolistas xs Mediocampo
contarFutbolistas ((Futbolista(Defensa)(x)(y)(z)):xs) Defensa = 1 + contarFutbolistas xs Defensa
contarFutbolistas ((Futbolista(Delantera)(x)(y)(z)):xs) Delantera = 1 + contarFutbolistas xs Delantera
contarFutbolistas (x:xs) y = 0 + contarFutbolistas xs y



--Ejemplos
--contarFutbolistas [Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3] Arco
--3

--contarFutbolistas [Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3] Mediocampo
--0

--Ejercicio 4 inciso e
futbolistasZona :: Zona -> Deportista -> Bool
futbolistasZona Arco (Futbolista Arco y x e) = True 
futbolistasZona Defensa (Futbolista Defensa y x e) = True 
futbolistasZona Delantera (Futbolista Delantera y x e) = True 
futbolistasZona Mediocampo (Futbolista Mediocampo y x e) = True 
futbolistasZona z _ = False

--Ejemplos
--futbolistasZona Arco (Futbolista Arco 1 Izquierda 3)
--True

--futbolistasZona Arco (Futbolista Mediocampo 1 Izquierda 3)
--False

contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' ds z = length (filter (futbolistasZona z) ds)

--Ejemplos
--contarFutbolistas' [Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3] Arco
--3

--contarFutbolistas' [Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3, Futbolista Arco 1 Derecha 3] Mediocampo
--0

--Ejercicio 5 inciso a

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--Ejemplos
--sonidoNatural Do
--0

--sonidoNatural Re
--2

--Ejercicio 5 inciso b

data Alteracion = Bemol | Natural | Sostenido

--Ejercicio 5 inciso c

data NotaMusical = Nota NotaBasica Alteracion

--Ejercicio 5 inciso d

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Bemol) = (sonidoNatural n) - 1
sonidoCromatico (Nota n Sostenido) = (sonidoNatural n) + 1
sonidoCromatico (Nota n Natural) = sonidoNatural n

--Ejemplos
--sonidoCromatico (Nota Do Bemol)
--(-1)

--sonidoCromatico (Nota Do Sostenido)
--1

--Ejercicio 5 inciso e

instance Eq NotaMusical where
    n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2

--Ejercicio 5 inciso f

instance Ord NotaMusical where
    n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

--Ejercicio 6 inciso a

primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

--Ejemplos
--primerElemento [1,2,3]
--Just 1

--primerElemento []
--Nothing

--Ejercicio 7 inciso a

data Cola = ColaV | Encolada Deportista Cola deriving Show

--Ejercicio 7 inciso a-1

atender :: Cola -> Maybe Cola
atender ColaV = Nothing
atender (Encolada d c) = Just c

--Ejemplos
--atender (Encolada (Futbolista Arco 2 Izquierda 4) (Encolada (Futbolista Arco 1 Izquierda 3) ColaV))
--Just (Encolada (Futbolista Arco 1 Izquierda 3) ColaV)

--atender ColaV
--Nothing

--Ejercicio 7 inciso a-2

encolar :: Deportista -> Cola -> Cola
encolar d ColaV = Encolada d ColaV
encolar d (Encolada x y) = Encolada x (encolar d y)

--Ejemplos
--encolar (Futbolista Arco 1 Izquierda 3) (Encolada (Futbolista Arco 2 Izquierda 4) ColaV)
--(Encolada (Futbolista Arco 2 Izquierda 4) (Encolada (Futbolista Arco 1 Izquierda 3) ColaV))

--encolar (Futbolista Arco 1 Izquierda 3) ColaV
--(Encolada (Futbolista Arco 1 Izquierda 3) ColaV)

busca :: Cola -> Zona -> Maybe Deportista
busca ColaV z = Nothing 
busca (Encolada (Futbolista Arco x y e) c) Arco = Just (Futbolista Arco x y e)
busca (Encolada (Futbolista Defensa x y e) c) Defensa = Just (Futbolista Defensa x y e)
busca (Encolada (Futbolista Mediocampo x y e) c) Mediocampo = Just (Futbolista Mediocampo x y e)
busca (Encolada (Futbolista Delantera x y e) c) Delantera = Just (Futbolista Delantera x y e)
busca (Encolada d c) z = busca c z

--Ejemplos
--busca (Encolada (Futbolista Arco 1 Izquierda 3) ColaV) Arco
--Just (Futbolista Arco 1 Izquierda 3)

--busca (Encolada (Futbolista Arco 1 Izquierda 3) ColaV) Mediocampo
--Nothing

--Ejercicio 8

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

--Ejercicio 8 inciso a 

type ListaTelefonica = ListaAsoc String Int 

--Ejercicio 8 inciso b - 1

laLong :: ListaAsoc a b -> Int
laLong Vacia = 0
laLong (Nodo a b l) = 1 + laLong l

--Ejemplos
--laLong (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
--3

--laLong Vacia
--0

--Ejercicio 8 inciso b - 2

laConcat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
laConcat Vacia l = l
laConcat (Nodo a b l) l1 = Nodo a b (laConcat l l1) 

--Ejemplos
--laConcat (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) (Nodo "d" 4 (Nodo "e" 5 (Nodo "f" 6 Vacia)))
--(Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 (Nodo "d" 4 (Nodo "e" 5 (Nodo "f" 6 Vacia))))))

--laConcat Vacia (Nodo "d" 4 (Nodo "e" 5 (Nodo "f" 6 Vacia)))
--(Nodo "d" 4 (Nodo "e" 5 (Nodo "f" 6 Vacia)))


--Ejercicio 8 inciso b - 3

laAgregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
laAgregar Vacia c v = (Nodo c v Vacia)
laAgregar (Nodo a b l) c v | c == a = (Nodo a v l)
                           | otherwise = (Nodo a b (laAgregar l c v))

--Ejemplos
--laAgregar (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "d" 4
--(Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 (Nodo "d" 4 Vacia))))

--laAgregar (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "a" 4
--(Nodo "a" 4 (Nodo "b" 2 (Nodo "c" 3 Vacia)))

--Ejercicio 8 inciso b - 4

laPares :: ListaAsoc a b -> [(a,b)]
laPares Vacia = []
laPares (Nodo a b l) = (a,b):(laPares l)

--Ejemplos
--laPares (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
--[("a",1),("b",2),("c",3)]

--laPares Vacia
--[]

--Ejercicio 8 inciso b - 5

laBusca :: Eq a => ListaAsoc a b -> a -> Maybe b 
laBusca Vacia c = Nothing
laBusca (Nodo a b l) c | a == c = Just b
                       | otherwise = laBusca l c

--Ejemplos
--laBusca (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "a"
--Just 1

--laBusca (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "d"
--Nothing

--Ejercicio 8 inciso b - 6 

laBorrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
laBorrar c Vacia = Vacia
laBorrar c (Nodo a b l) | a == c = laBorrar c l
                        | otherwise = Nodo a b (laBorrar c l) 

--Ejemplos 
--laBorrar "a" (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
--(Nodo "b" 2 (Nodo "c" 3 Vacia))

--laBorrar "d" (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
--(Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))

-- Ejercicio 9 inciso a

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a ) deriving Show

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

--Ejemplo
--a_long (Rama (Rama Hoja 1 Hoja) 2 (Rama Hoja 3 Hoja)) = 3

-- Ejercicio 9 inciso b

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama izq _ der) = a_hojas izq + a_hojas der

--Ejemplo
--a_hojas (Rama (Rama Hoja 1 Hoja) 2 (Rama Hoja 3 Hoja)) = 4

-- Ejercicio 9 inciso c
a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama izq x der) = Rama (a_inc izq) (x + 1) (a_inc der)

--Ejemplo
--a_inc (Rama (Rama Hoja 1 Hoja) 2 (Rama Hoja 3 Hoja)) = Rama (Rama Hoja 2 Hoja) 3 (Rama Hoja 4 Hoja)

-- Ejercicio 9 inciso d
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map f (Rama izq x der) = Rama (a_map f izq) (f x) (a_map f der)

--Ejemplo
--a_map (*2) (Rama (Rama Hoja 1 Hoja) 2 (Rama Hoja 3 Hoja)) = Rama (Rama Hoja 2 Hoja) 4 (Rama Hoja 6 Hoja)

-- Ejercicio 10 inciso a
data ABB a = RamaABB (ABB a) a (ABB a) | VacioABB deriving (Show, Eq, Ord)

-- Ejercicio 10 inciso b
insertarABB :: Ord a => a -> ABB a -> ABB a
insertarABB x VacioABB = RamaABB VacioABB x VacioABB
insertarABB x (RamaABB izq y der)
    | x < y = RamaABB (insertarABB x izq) y der
    | x > y = RamaABB izq y (insertarABB x der)
    | otherwise = RamaABB izq y der

--Ejemplo
-- insertarABB 1 (RamaABB (RamaABB VacioABB 2 VacioABB) 3 (RamaABB VacioABB 4 VacioABB))
-- = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 2 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)

-- Ejercicio 10 inciso c
buscarEnArbol :: (Eq a, Ord a) => a -> ABB a -> Bool
buscarEnArbol _ VacioABB = False
buscarEnArbol x (RamaABB izq y der)
    | x == y = True
    | x < y = buscarEnArbol x izq
    | otherwise = buscarEnArbol x der

--Ejemplo
-- buscarEnArbol 1 (RamaABB (RamaABB VacioABB 2 VacioABB) 3 (RamaABB VacioABB 4 VacioABB))
-- = False

-- Ejercicio 10 inciso d
mayor_a_todos :: Ord a => a -> ABB a -> Bool
mayor_a_todos _ VacioABB = True
mayor_a_todos x (RamaABB izq y der) = x > y && mayor_a_todos x izq && mayor_a_todos x der

menor_a_todos :: Ord a => a -> ABB a -> Bool
menor_a_todos _ VacioABB = True
menor_a_todos x (RamaABB izq y der) = x < y && menor_a_todos x izq && menor_a_todos x der

verificarABB :: Ord a => ABB a -> Bool
verificarABB VacioABB = True
verificarABB (RamaABB izq y der) = menor_a_todos y der && mayor_a_todos y izq && verificarABB izq && verificarABB der


--Ejemplo
ejemploA :: ABB Int
ejemploA = RamaABB 
            (RamaABB VacioABB 10 VacioABB) 
            2 
            (RamaABB VacioABB 11 VacioABB)

ejemploB :: ABB Int
ejemploB = RamaABB 
            (RamaABB 
                (RamaABB VacioABB 1 VacioABB) 
                3 
                (RamaABB VacioABB 7 VacioABB)) 
            5 
            (RamaABB 
                VacioABB 
                8 
                (RamaABB VacioABB 10 VacioABB))

--verificarABB ejemploA = False
--verificarABB ejemploB = False

ejemploC :: ABB Int
ejemploC = RamaABB 
            (RamaABB 
                (RamaABB VacioABB 1 VacioABB) 
                3 
                (RamaABB VacioABB 4 VacioABB)) 
            5 
            (RamaABB 
                VacioABB 
                8 
                (RamaABB VacioABB 10 VacioABB))