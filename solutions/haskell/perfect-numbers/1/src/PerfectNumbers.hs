module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n 
  | n < 1      = Nothing
  | n == 1     = Just Deficient
  | sFacs == n = Just Perfect
  | sFacs <  n = Just Deficient
  | sFacs >  n = Just Abundant
  | otherwise  = error "Unknown error"
  where
    sFacs = sumFactors n

sumFactors :: Int -> Int
sumFactors n = 1 + sum [if e /= n `div` e then e + n `div` e else e | e <- [2..(floor $ sqrt $ fromIntegral n)], n `mod` e == 0]
      
