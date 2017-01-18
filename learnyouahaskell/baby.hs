doubleme x = x + x
doubleus x y = x*2 + y*2
doublesmallnumber x = if x < 100
    then x * 2
    else x

circumference :: Float -> Float  
circumference r = 2 * pi * r 

circumference' :: Double -> Double  
circumference' r = 2 * pi * r 

lucky :: (Integral a) => a -> String
lucky 7 = "Yes"
lucky x = "No"
