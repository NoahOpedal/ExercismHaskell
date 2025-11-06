module GameOfLife (tick) where

tick :: [[Int]] -> [[Int]]
tick []         = []
tick l
    | length l == 1 = evalCells [[sum ns | ns <- getNeighbours l]] l
    | length l == 2 = evalCells [[sum ns | ns <- row] | row <- [getNeighbours l, getNeighbours $ reverse l]] l
    | otherwise     = let 
            first  = [getNeighbours [l!!0, l!!1]]
            middle = [getNeighbours [top, mid, bottom] | (top, mid, bottom) <- iterTriples l]
            final  = [getNeighbours [last l, last $ init l]]
            sums   = [[sum ns | ns <- row] | row <- first ++ middle ++ final]
        in evalCells sums l

iterTriples :: [a] -> [(a, a, a)]
iterTriples l = zip3 l (drop 1 l) (drop 2 l)

evalCells :: [[Int]] -> [[Int]] -> [[Int]]
evalCells sums cells = [[if ((s == 2 || s == 3) && c == 1) || (s == 3 && c == 0) then 1 else 0 
                        | (s, c) <- zip rowS rowC] 
                        | (rowS, rowC) <- zip sums cells]

getNeighbours :: [[a]] -> [[a]]
getNeighbours []        = []
getNeighbours [a]       = [[a!!1]]
                        ++[[n0, n1] | (n0, _, n1) <- iterTriples a]
                        ++[[last $ init a]]
getNeighbours [a, b]    = [[a!!1, b!!0, b !! 1]]
                        ++[[n0, n1, n2, n3, n4] | ((n0, _, n1), (n2, n3, n4)) <- zip (iterTriples a) (iterTriples b)]
                        ++[[last $ init a, last $ init b, last b]]
getNeighbours [a, b, c] = [[a!!0, a !! 1, b !! 1, c!!0, c !! 1]]
                        ++[[n0, n1, n2, n3, n4, n5, n6, n7] 
                           | ((n0, n1, n2), (n3, _, n4), (n5, n6, n7)) 
                           <- zip3 (iterTriples a) (iterTriples b) (iterTriples c)]
                        ++[[last $ init a, last a, last $ init b, last $ init c, last c]]