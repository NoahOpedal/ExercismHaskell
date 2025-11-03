module Prime (nth) where

nth :: Integer -> Maybe Integer
nth n 
  | n < 1 = Nothing
  | otherwise = Just (nthHelper 2 n)

nthHelper :: Integer -> Integer -> Integer
nthHelper candidate n 
  | not $ isPrime candidate = nthHelper (candidate+1) n
  | n == 1                  = candidate
  | n /= 1                  = nthHelper (candidate+1) (n-1)
  | otherwise               = error "unexpected input for nthHelper"

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime n = all (\x -> n `mod` x /= 0) [2..(floor $ sqrt $ (fromIntegral n :: Double))]