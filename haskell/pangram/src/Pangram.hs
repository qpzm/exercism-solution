module Pangram (isPangram) where
import Data.Char (ord, toLower)
import Data.List (nub)

isPangram :: String -> Bool
isPangram = (==) 26 . length . filter (\c -> c `elem` ['a'..'z']) . nub . (map toLower)
