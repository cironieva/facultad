-- LA PARTE DE LAS NOTAS MUSICALES

-- Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
                  deriving (Eq, Ord, Show)


-- cifradoAmericano : : NotaBasica −> Char que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres ’C’ , ’D’, ’E’, ’F’, ’G’, ’A’ y ’B’ respectivamente.

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do  = 'C'
cifradoAmericano Re  = 'D'
cifradoAmericano Mi  = 'E'
cifradoAmericano Fa  = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La  = 'A'
cifradoAmericano Si  = 'B'

-- *Main> cifradoAmericano Do
-- 'C'

-- *Main> cifradoAmericano Re
-- 'D'


-- Completar la definici ́on del tipo NotaBasica para que las expresiones
-- *Main> Do <= Re
-- *Main> Fa `min` Sol
-- sean v ́alidas y no generen error. Ayuda: usar deriving con m ́ultiples clases.

-- Agregué a NotaBasica deriving (Eq, Ord, Show)

-- *Main> Do <= Re
-- True

-- *Main> Fa `min` Sol
-- Fa


-- Definir para las notas b ́asicas la funci ́on sonidoNatural:

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do  = 0
sonidoNatural Re  = 2
sonidoNatural Mi  = 4
sonidoNatural Fa  = 5
sonidoNatural Sol = 7
sonidoNatural La  = 9
sonidoNatural Si  = 11

-- *Main> sonidoNatural Do
-- 0

-- *Main> sonidoNatural Re
-- 2


-- Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido.

data Alteracion = Bemol | Natural | Sostenido


-- Definir el tipo NotaMusical que consta de un  ́unico constructor que toma dos par ́ametros. El primer par ́ametro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una nota alterada se puede usar como segundo par ́ametro del constructor un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como segundo par ́ametro.

data NotaMusical = Nota NotaBasica Alteracion


-- Defin ́ı la funci ́on sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota, incrementando en uno su valor si tiene la alteraci ́on Sostenido, decre- mentando en uno si tiene la alteraci ́on Bemol y dejando su valor intacto si la alteraci ́on es Natural

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota x Bemol)     = sonidoNatural x - 1
sonidoCromatico (Nota x Natural)   = sonidoNatural x
sonidoCromatico (Nota x Sostenido) = sonidoNatural x + 1

-- *Main> sonidoCromatico (Nota Do Natural)
-- 0

-- *Main> sonidoCromatico (Nota Re Sostenido)
-- 3


-- Inclu ́ı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo valor de sonidoCromatico se consideren iguales.

instance Eq NotaMusical where
    nota1 == nota2 = sonidoCromatico nota1 == sonidoCromatico nota2

-- *Main> (Nota Do Natural) == (Nota Do Natural)
-- True

-- *Main> (Nota Do Natural) == (Nota Re Sostenido)
-- False


-- Inclu ́ı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir que una nota es menor o igual a otra si y s ́olo si el valor de sonidoCromatico para la primera es menor o igual al valor de sonidoCromatico para la segunda.

instance Ord NotaMusical where
    nota1 <= nota2 = sonidoCromatico nota1 <= sonidoCromatico nota2

-- *Main> (Nota Do Natural) <= (Nota Re Sostenido)
-- True

-- *Main> (Nota Re Sostenido) <= (Nota Do Natural)
-- False


-----------------------------------------------------------------------------------------------------------------------------

-- LA PARTE DE LOS DEPORTISTAS

-- Sinonimos de tipo
type Altura      = Int
type NumCamiseta = Int
type ManoHabil   = PiernaHabil 

-- Tipos algebraicos sin parametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera
            deriving Show

data TipoReves = DosManos | UnaMano
                 deriving Show

data Modalidad = Carretera | Pista | Monte | BMX
                 deriving Show

data PiernaHabil = Izquierda | Derecha
                   deriving Show


-- Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista                                     -- Constructor sin argumentos
                | Ciclista Modalidad                              -- Constructor con un argumento
                | Velocista Altura                                -- Constructor con un argumento
                | Tenista TipoReves ManoHabil Altura              -- Constructor con tres argumentos
                | Futbolista Zona NumCamiseta PiernaHabil Altura  -- Constructor con cuatro argumentos
                deriving Show


-- contar_velocistas :: [Deportista] -> Int que dada una lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs

contar_velocistas :: [Deportista] -> Int
contar_velocistas []                 = 0
contar_velocistas ((Velocista _):xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs)             = contar_velocistas xs

-- *Main> contar_velocistas [Ajedrecista, Ciclista Carretera]
-- 0

-- *Main> contar_velocistas [Ajedrecista, Velocista 1, Ciclista Carretera]
-- 1


-- contar_futbolistas :: [Deportista] -> Zona -> Int que dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar igualdad, utilizando pattern matching.

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _                                          = 0
contar_futbolistas ((Futbolista Arco _ _ _):xs) Arco             = 1 + contar_futbolistas xs Arco
contar_futbolistas ((Futbolista Defensa _ _ _):xs) Defensa       = 1 + contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista Mediocampo _ _ _):xs) Mediocampo = 1 + contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista Delantera _ _ _):xs) Delantera   = 1 + contar_futbolistas xs Delantera
contar_futbolistas (_:xs) z                                      = contar_futbolistas xs z

-- *Main> contar_futbolistas [Ajedrecista, Velocista 1] Arco
-- 0

-- *Main> contar_futbolistas [Ajedrecista, Futbolista Arco 1 Izquierda 180, Velocista 1, Futbolista Defensa 2 Derecha 175] Arco
-- 1


-- ¿La funci ́on anterior usa filter? Si no es as ́ı, reprogramala para usarla.

filtrar_futbolistas :: Deportista -> Zona -> Bool   -- funcion auxiliar
filtrar_futbolistas (Futbolista Arco _ _ _) Arco             = True
filtrar_futbolistas (Futbolista Defensa _ _ _) Defensa       = True
filtrar_futbolistas (Futbolista Mediocampo _ _ _) Mediocampo = True
filtrar_futbolistas (Futbolista Delantera _ _ _) Delantera   = True
filtrar_futbolistas _ _                                      = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' xs z = length (filter (\x -> filtrar_futbolistas x z) xs)

-- *Main> contar_futbolistas' [Ajedrecista, Velocista 1] Arco
-- 0

-- *Main> contar_futbolistas' [Ajedrecista, Futbolista Arco 1 Izquierda 180, Velocista 1, Futbolista Defensa 2 Derecha 175] Arco
-- 1