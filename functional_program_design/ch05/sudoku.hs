-- Thinking Functionally with Haskell
-- Chapter 05 solve Sudoku
--

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
solve = filter valid . completions

-- completions fill blanks in a Grid, and produces all possible Grids
completions :: Grid -> [Grid]
completions = expand . choices

choices :: Grid -> Matrix [Digit]
choices m = zipWith rowCandidate [0..] m
            where candidate idxR idxC y = if blank y then (digits \\ (union (union (exR!!idxR) (exC!!idxC)) (exB!!(unitNum idxR idxC))) ) else [y]
                  rowCandidate idxR xs = zipWith (candidate idxR) [0..] xs
                  (exR, exC, exB) = exclude m

-- get exclusions for rows, cols, blocks
exclude :: Grid -> ([Row Digit], [Row Digit], [Row Digit])
exclude m = (r, c, b)
            where excludeGrid = map (nub . foldl (\ys y -> if blank y then ys else (y:ys)) [])
                  r = excludeGrid m
                  c = excludeGrid (transpose m)
                  b = excludeGrid (unitGrid m)

expand :: Matrix [Digit] -> [Grid]
expand _ = []

-- valid checks if a Grid is a valid Grid
valid :: Grid -> Bool
valid m = and [blocksValid, rowsValid, colsValid]
          where blocksValid = and (map validRow (unitGrid m))
                rowsValid = and (map validRow m)
                colsValid = and (map validRow (transpose m))


-- unitGrid puts 3*3 blocks in a 9*9 Grid into one Row
unitGrid :: Grid -> [Row Digit]
unitGrid = map concat . concat . map (splitGrid . transpose) . splitGrid

-- unitNum get the index of the block(unit) in a 9*9 Grid
unitNum :: Int -> Int -> Int
unitNum row col 
        | row < 3 && col < 3 = 0
        | row < 3 && col < 6 = 1
        | row < 3 = 2
        | row < 6 && col < 3 = 3
        | row < 6 && col < 6 = 4
        | row < 6 = 5
        | col < 3 = 6
        | col < 6 = 7
        | otherwise = 8

-- splitList splits a list with length n into n/3 list with 3 elements
splitList :: Int -> [a] -> [[a]]
splitList interval g = reverse (map reverse (foldl appendX [] g))
            where appendX [] x = [[x]]
                  appendX (xs:xss) x = if length xs < interval then (x:xs):xss
                                       else [x]:xs:xss

-- splitGrid splits a 9*9 Grid into 3 3*9 Grids
splitGrid :: Grid -> [Grid]
splitGrid = splitList 3

validRow :: Row Digit -> Bool
validRow xs = snd (foldl acc ('0', True) xs)
              where acc (prev, False) x = (x, False) -- duplication found
                    acc (prev, True) x = (x, x /= prev)

-- sample.json is all the possibilities of Grid
sample = ["004005700", "000009400", "360000008", "720060000", "000402000", "000080093", "400000056", "005300000", "006100900"]