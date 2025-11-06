module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number xs
  | length norm /= 10     = Nothing
  | head norm `elem` "01" = Nothing
  | norm !! 3 `elem` "01" = Nothing
  | otherwise             = Just norm
  where
    filtered = filter isDigit xs
    norm = if head filtered == '1' then tail filtered else filtered