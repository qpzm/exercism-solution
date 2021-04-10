module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Empty | Node a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Node _ Empty _) = Nothing
bstLeft (Node _ x _) = Just x

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Node _ _ Empty) = Nothing
bstRight (Node _ _ x) = Just x

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (Node x _ _) = Just x

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
--fromList = foldl (\tree x -> insert x tree) Empty
fromList = foldl (flip insert) Empty

insert :: Ord a => a -> BST a -> BST a
insert x tree =
    case tree of
      Empty -> singleton x
      Node y left right ->
          if x > y
             then Node y left (insert x right)
             else Node y (insert x left) right

singleton :: a -> BST a
singleton x = Node x Empty Empty

toList :: BST a -> [a]
toList Empty = []
toList (Node x left right) = toList left ++ [x] ++ toList right
