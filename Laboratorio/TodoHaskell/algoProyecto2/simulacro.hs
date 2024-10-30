--ejercicio 1
--a)
data Modalidad = Carretera | Pista deriving Show
data Deportista = Velocista Altura | Ciclista Modalidad deriving Show
type Altura = Int
--b)
juan :: Deportista
juan = Velocista 172
--c)
esVelocistaAlto :: Deportista -> Int -> Bool
esVelocistaAlto (Velocista a) n = a >= n
esVelocistaAlto _ n = False
--d)
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas ((Velocista _):xs) = 1 + contarVelocistas xs
contarVelocistas (_:xs) = contarVelocistas xs
--e) 
esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True
esCiclista d = False

--Ejercicio 2
data Cola = VaciaC | Encolada Deportista Cola deriving Show
--a)
encolar :: Deportista -> Cola -> Cola
encolar d0 VaciaC = Encolada d0 VaciaC
encolar d0 (Encolada d1 cola) = Encolada d1 (encolar d0 cola)