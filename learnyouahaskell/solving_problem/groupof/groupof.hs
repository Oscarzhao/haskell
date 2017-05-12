-- groupOf split a slice into a slice of slice

groupOf :: Int -> [a] -> [[a]]
groupOf 0 _ = undefined
groupOf _ [] = []
groupOf n xs = take n xs : groupOf n (drop n xs)

