-- LA PARTE DE LOS DATOS RECURSIVOS

-- Definiciones necesarias
type Altura      = Int
type NumCamiseta = Int
type ManoHabil   = PiernaHabil 

data Zona        = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves   = DosManos | UnaMano                      deriving Show
data Modalidad   = Carretera | Pista | Monte | BMX         deriving Show
data PiernaHabil = Izquierda | Derecha                     deriving Show

data Deportista  = Ajedrecista
                 | Ciclista Modalidad
                 | Velocista Altura
                 | Tenista TipoReves ManoHabil Altura
                 | Futbolista Zona NumCamiseta PiernaHabil Altura
                 deriving Show

-----------------------------------------------------------------------------------------------------------------------------

-- TIPOS RECURSIVOS

data Cola = VaciaC | Encolada Deportista Cola
            deriving Show

-- atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est ́a en la primer posici ́on de una cola, por haber sido atendida. Si la cola est ́a vac ́ıa, devuelve Nothing.

atender :: Cola -> Maybe Cola
atender VaciaC          = Nothing
atender (Encolada x xs) = Just xs

-- fue necesario agragar deriving Show a todos los tipos

-- *Main> atender VaciaC
-- Nothing

-- *Main> atender (Encolada (Velocista 1) (Encolada (Velocista 2) (Encolada (Velocista 3) VaciaC)))
-- Just (Encolada (Velocista 2) (Encolada (Velocista 3) VaciaC))

-----------------------------------------------------------------------------------------------------------------------------


-- encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola de deportistas, en la  ́ultima posici ́on.

encolar :: Deportista -> Cola -> Cola
encolar depor VaciaC          = Encolada depor VaciaC
encolar depor (Encolada x xs) = Encolada x (encolar depor xs)

-- *Main> encolar (Velocista 1) VaciaC
-- Encolada (Velocista 1) VaciaC

-- *Main> encolar (Velocista 1) (Encolada (Velocista 2) (Encolada (Velocista 3) VaciaC))
-- Encolada (Velocista 2) (Encolada (Velocista 3) (Encolada (Velocista 1) VaciaC))

-----------------------------------------------------------------------------------------------------------------------------


-- busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo par ́ametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _                                              = Nothing
busca (Encolada (Futbolista Arco x y z) _) Arco             = Just (Futbolista Arco x y z)
busca (Encolada (Futbolista Defensa x y z) _) Defensa       = Just (Futbolista Defensa x y z)
busca (Encolada (Futbolista Mediocampo x y z) _) Mediocampo = Just (Futbolista Mediocampo x y z)
busca (Encolada (Futbolista Delantera x y z) _) Delantera   = Just (Futbolista Delantera x y z)
busca (Encolada _ xs) z                                     = busca xs z

-- *Main> busca (Encolada (Ajedrecista)  (Encolada (Velocista 170) VaciaC)) Arco
-- Nothing

-- *Main> busca (Encolada (Ajedrecista) (Encolada (Futbolista Arco 1 Izquierda 180) (Encolada (Futbolista Arco 2 Derecha 190) VaciaC))) Arco
-- Just (Futbolista Arco 1 Izquierda 180)



-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------



-- TIPOS RECURSIVOS Y POLIMORFICOS

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving Show

-- la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.

la_long :: ListaAsoc a b -> Int
la_long Vacia         = 0
la_long (Nodo a b xs) = 1 + la_long xs

-- *Main> la_long Vacia
-- 0

-- *Main> la_long (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) :: Int
-- 3

-----------------------------------------------------------------------------------------------------------------------------


-- la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que de- vuelve la concatenaci ́on de dos listas de asociaciones.

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia ys         = ys
la_concat (Nodo a b xs) ys = Nodo a b (la_concat xs ys)

-- fue necesario agregar deriving Show a ListaAsoc a b

-- *Main> la_concat Vacia (Nodo "c" 3 (Nodo "d" 4 Vacia))
-- Nodo "c" 3 (Nodo "d" 4 Vacia)

-- *Main> la_concat (Nodo "a" 1 (Nodo "b" 2 Vacia)) (Nodo "c" 3 (Nodo "d" 4 Vacia))
-- Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 (Nodo "d" 4 Vacia)))

-----------------------------------------------------------------------------------------------------------------------------


-- la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no est ́a en la lista, o actualiza el valor si la clave ya se encontraba.

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia c d                     = Nodo c d Vacia
la_agregar (Nodo a b xs) c d | c == a    = Nodo a d xs
                             | otherwise = Nodo a b (la_agregar xs c d)

-- *Main> la_agregar (Nodo "a" 1 (Nodo "c" 3 Vacia)) "b" 2
-- Nodo "a" 1 (Nodo "c" 3 (Nodo "b" 2 Vacia))

-- *Main> la_agregar (Nodo "a" 1 (Nodo "c" 3 Vacia)) "c" 9
-- Nodo "a" 1 (Nodo "c" 9 Vacia)

-----------------------------------------------------------------------------------------------------------------------------


-- la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asocia- ciones en una lista de pares clave-dato.

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia         = []
la_pares (Nodo a b xs) = (a, b) : la_pares xs

-- *Main> la_pares Vacia
-- []

-- *Main> la_pares (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
-- [("a",1),("b",2),("c",3)]

-----------------------------------------------------------------------------------------------------------------------------


-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _                     = Nothing
la_busca (Nodo a b xs) c | a == c    = Just b
                         | otherwise = la_busca xs c

-- *Main> la_busca (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "b"
-- Just 2

-- *Main> la_busca (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))) "d"
-- Nothing

-----------------------------------------------------------------------------------------------------------------------------


-- la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada una clave a elimina la entrada en la lista.

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia                     = Vacia
la_borrar c (Nodo a b xs) | a == c    = la_borrar c xs
                          | otherwise = Nodo a b (la_borrar c xs)

-- *Main> la_borrar "b" (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
-- Nodo "a" 1 (Nodo "c" 3 Vacia)

-- *Main> la_borrar "d" (Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia)))
-- Nodo "a" 1 (Nodo "b" 2 (Nodo "c" 3 Vacia))

