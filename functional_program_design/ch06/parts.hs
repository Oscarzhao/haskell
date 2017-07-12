-- Thinking Functionally with Haskell
-- Chapter 06  6.4 introduce foldl
-- function parts split a num string into Integer part and Float part

-- the parameter order is different for foldl and foldr

parts :: String -> (Integer, Float)
parts ds = (ipart es, fpart fs) 
           where (es, d:fs) = break (=='.') ds 

ipart = foldl shiftl 0 . map toDigit
        where shiftl n d = n * 10 + d 

fpart = foldr shiftr 0 . map toDigit 
        where shiftr d x = (d+x)/10

toDigit d = fromIntegral (fromEnum d - fromEnum '0')
