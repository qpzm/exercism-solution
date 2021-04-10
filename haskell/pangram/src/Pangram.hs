module Pangram (isPangram) where
import Data.Char (ord, toLower)
import Data.List (nub)


isPangram :: String -> Bool
--Solution1 O(n^2)
--isPangram = (==) 26 . length . filter (\c -> c `elem` ['a'..'z']) . nub . map toLower
--Solution2
isPangram str = all (>= 1) $ countChar str' zeros
  where str' = filter (\c -> c `elem` ['a'..'z']) $ map toLower str
        zeros = take 26 (repeat 0)

countChar :: [Char] -> [Integer] -> [Integer]
countChar [] counts = counts
countChar (x : xs) counts = countChar xs (increment counts $ toInteger $ ord x - ord 'a')

increment :: [Integer] -> Integer -> [Integer]
increment l k = [if i == k then x + 1 else x | (i,x) <- zip [0..] l]
