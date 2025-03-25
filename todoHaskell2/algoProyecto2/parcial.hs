-- Ejercicio 1

-- Van a representar canciones que se pueden escuchar en un servicio de streaming en
-- modalidad gratuita como Spotify, Youtube, SoundCloud, etc. Para ello deben

-- a) Definir los tipos Titulo y Artista como sinónimos del tipo String y el tipo
-- Duracion como sinónimo del tipo Int. Además se debe definir el tipo Genero, con
-- constructores Rock, Blues, Pop, Jazz (todos sin parámetros).
-- El tipo Genero no debe estar en la clase Eq.
-- Por último deben definir el tipo Cancion que tiene constructores:
-- ● Constructor Tema con parámetros:
-- ○ El primero de tipo Titulo
-- ○ El segundo del tipo Artista
-- ○ El tercero del tipo Genero
-- ○ El cuarto del tipo Duracion (la cantidad de segundos que dura la canción)
-- ● Constructor Publicidad que tiene un único parámetro Duracion (cantidad de
-- segundos que dura la molesta publicidad)

type Titulo = String
type Artista = String
type Duracion = Int

data Genero = Rock | Blues | Pop | Jazz -- no derive Eq

data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion
               


-- b) Definir mediante pattern matching la función
-- mismo_genero :: Genero -> Genero -> Bool
-- que dados dos valores g1 y g2 del tipo Genero, debe devolver True cuando g1 y
-- g2 correspondan al mismo género musical (se construyen con el mismo constructor) y
-- False en caso contrario. Si se usan más de cinco casos, este apartado sumará menos puntaje.

mismo_genero :: Genero -> Genero -> Bool
-- mismo_genero g1 g2 = g1 == g2                 no se puede porque genero no debe pertenecer a Eq 
mismo_genero Rock Rock   = True
mismo_genero Blues Blues = True
mismo_genero Pop Pop     = True
mismo_genero Jazz Jazz   = True
mismo_genero _ _         = False


-- c) Definir la función
-- duracion_de :: Cancion -> Duracion
-- que dada una canción c devuelve la cantidad de segundos que dura su reproducción (ya
-- sea un tema musical o una publicidad)

duracion_de :: Cancion -> Duracion
duracion_de (Tema _ _ _ duracion) = duracion
duracion_de (Publicidad duracion) = duracion


-- d) Incluir el tipo Cancion en la clase Ord de manera tal que una canción c1 sea
-- menor o igual que otra canción c2 si la duración de c1 es menor o igual que la duración de c2.

instance Eq Cancion where
    c1 == c2 = duracion_de c1 == duracion_de c2 -- para que instancie en Ord, es necesario que lo haga también en Eq

instance Ord Cancion where
    c1 <= c2 = duracion_de c1 <= duracion_de c2



-- Ejercicio 2

-- Definir usando recursión y pattern matching:
-- solo_genero :: [Cancion] -> Genero -> [Titulo]
-- que dada una lista de canciones cs y un género gi devuelve los títulos de las canciones
-- en cs que son temas musicales con género gi
-- IMPORTANTE: No se puede utilizar el operador == para hacer la comparación entre
-- valores del tipo Genero puesto que el tipo no está en la clase Eq

solo_genero :: [Cancion] -> Genero -> [Titulo]
solo_genero [] _ = []
solo_genero ((Tema titulo _ Rock _) : cs) Rock   = titulo : solo_genero cs Rock
solo_genero ((Tema titulo _ Blues _) : cs) Blues = titulo : solo_genero cs Blues
solo_genero ((Tema titulo _ Pop _) : cs) Pop     = titulo : solo_genero cs Pop
solo_genero ((Tema titulo _ Jazz _) : cs) Jazz   = titulo : solo_genero cs Jazz
solo_genero ((Publicidad _) : cs) gi             = solo_genero cs gi



-- Ejercicio 3
-- Basados en el tipo ListaAsoc del Proyecto 2, programar la función:
-- la_suma_mayores :: ListaAsoc a b -> b -> b
-- que dada una lista de asociaciones la y un dato x devuelve la suma de los datos de la que son mayores a x.
-- Completar el tipado de la función para incluir los type classes necesarios para programarla.


data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)



la_suma_mayores :: (Num b, Ord b) => ListaAsoc a b -> b -> b
la_suma_mayores Vacia _ = 0
la_suma_mayores (Nodo a b xs) x | x < b     = b + la_suma_mayores xs x
                                | otherwise = la_suma_mayores xs x

-- Ejemplo:
-- la_suma_mayores (Nodo "a" 5 (Nodo "b" 10 (Nodo "c" 15 Vacia))) 7         = 25


-- Ejercicio 4
-- Programar la función a_listar :: Arbol a -> [a] que dado un árbol as de devuelve una lista con los elementos de as. En la lista resultante el elemento del padre siempre debe estar antes que los elementos de sus hijos.


data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a ) deriving Show


a_listar :: Arbol a -> [a]
a_listar Hoja = []
a_listar (Rama izq x der) = [x] ++ a_listar izq ++ a_listar der


ejemplo3 :: Arbol Int
ejemplo3 = Rama 
            (Rama 
                (Rama Hoja 1 Hoja) 
                3 
                (Rama Hoja 4 Hoja)) 
            5 
            (Rama 
                Hoja 
                8 
                (Rama Hoja 10 Hoja))


-- *Main> a_listar ejemplo3 
-- [5,3,1,4,8,10]
