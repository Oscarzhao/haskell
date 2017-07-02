-- Thinking Functionally with Haskell
-- Chapter 05 solve Sudoku
-- This is the solution in the textbook

import Data.List

-- Data Types
type Digit = Char

type Matrix a = [Row a]
type Row a = [a]

type Grid = Matrix Digit

-- Data
digits :: [Char]
digits = ['1'..'9']

-- Helper functions
blank :: Digit -> Bool
blank = (=='0')

-- main solve function
solve :: Grid -> [Grid]
solve =  filter valid . completions

-- completions fill blanks in a Grid, and produces all possible Grids
completions :: Grid -> [Grid]
completions = expand . choices

choices :: Grid -> Matrix [Digit]
choices = map (map choice)

choice :: Digit -> [Digit]
choice d = if blank d then digits else [d]

-- Cartesian Products
cp :: [[a]] -> [[a]]
cp []       = [[]]
cp (xs:xss) = [x:ys | x <- xs, ys <- yss]
              where yss = cp xss 

expand :: Matrix [Digit] -> [Grid]
expand = cp . map cp

-- valid returns true if a Grid (9*9) is valid
valid :: Grid -> Bool
valid g = all nodups (rows g) &&
          all nodups (cols g) &&
          all nodups (boxs g) 

nodups :: (Eq a) => [a] -> Bool 
nodups []  = True 
nodups (x:xs)  = all (/=x)  xs && nodups xs

rows :: Matrix a -> Matrix a 
rows = id 

cols :: Matrix a -> Matrix a 
cols [xs] = [[x] | x <- xs]
cols (xs:xss) = zipWith (:) xs (cols xss)

boxs :: Matrix a -> Matrix a 
boxs = map ungroup . ungroup . map cols . groupBy3 . map groupBy3 
 
groupBy3 :: [a] -> [[a]]
groupBy3 [] = []
groupBy3 xs = take 3 xs : groupBy3 (drop 3 xs)

ungroup :: [[a]] -> [a]
ungroup = concat

