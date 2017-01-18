module Vector3D
( Vector(..)
, vplus
, vectMult
, scalerMult
) where

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` l = Vector(i*l) (j*l) (k*l)

scalerMult :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `scalerMult` (Vector l m n) = Vector (i*l) (j*m) (k*n)
