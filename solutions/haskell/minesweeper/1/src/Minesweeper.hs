module Minesweeper (annotate) where

import Data.Char (intToDigit)

annotate :: [String] -> [String]
annotate board = let
    ints = [[if c == ' ' then 0 else -1 | c <- ln] | ln <- board]
    annInts = annotateInts ints
    norm = [[if e == -1 then '*' else if e == 0 then ' ' else intToDigit e | e <- ln] | ln <- annInts]
  in norm

annotateLn :: [Int] -> [Int]
annotateLn []  = []
annotateLn [a] = [a]
annotateLn (a:b:as)
    | a == -1 && b /= -1 = a : annotateLn ((b + 1):as)
    | a /= -1 && b == -1 = (a + 1) : annotateLn (b:as)
    | otherwise          = a : annotateLn (b:as)

annotateAllLn :: [Int] -> [Int]
annotateAllLn l = [ abs $ sum s 
                  | (e, s) <- zip l (take 2 l : segment 3 l ++ [drop (length l - 2) l])]

segment :: Int -> [a] -> [[a]]
segment n l
    | n >= length l = [l]
    | otherwise     = [[e1, e2, e3] | (e1, e2, e3) <- zip3 l (drop 1 l) (drop 2 l)]

denotateLn :: [Int] -> [Int]
denotateLn = map (\e -> if e == -1 then e else 0)

annotateInts :: [[Int]] -> [[Int]]
annotateInts []  = []
annotateInts [a] = if all (\x -> (x == 0) || (x == -1)) a then [annotateLn a] else [a]
annotateInts (a:b:as) = let
        annA = if all (\x -> (x == 0) || (x == -1)) a then annotateLn a else a 
        a' = [if ca /= -1 then ca + abs cb else ca | (ca, cb) <- zip annA (annotateAllLn b)]
        b' = [if cb /= -1 then cb + abs ca else cb | (ca, cb) <- zip (annotateAllLn $ denotateLn a) (annotateLn b)]
    in a' : annotateInts (b':as)