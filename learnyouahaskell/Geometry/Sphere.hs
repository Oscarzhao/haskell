module Geometry.Sphere
(
volume
, area
) where

volume :: Float -> Float
volume redius = (4.0 / 3.0) * pi * (redius ^ 3)

area :: Float -> Float
area redius = 4.0 * pi * (redius ^ 2)
