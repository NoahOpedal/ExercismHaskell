module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n = let
    bin = reverse $ reversedBinary n
    padded = replicate (5 - length bin) 0 ++ bin
    (rev:bs) = take 5 padded
    as = ["jump", "close your eyes", "double blink", "wink"]
    seq = [a | (a, b) <- zip as bs, b == 1]
  in if rev == 1 then seq else reverse seq
    

reversedBinary :: Int -> [Int]
reversedBinary 0 = []
reversedBinary n = n `mod` 2 : reversedBinary (n `div` 2)