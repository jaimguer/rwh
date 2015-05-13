myLength :: [a] -> Integer
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--average :: [a] -> Float
average l = (sumOfList l) / (fromIntegral $ length l)
          where
          sumOfList [] = 0
          sumOfList (x:xs) = x + sumOfList xs

data BinaryTree = Node Int BinaryTree BinaryTree
                | Empty


treeHeight :: BinaryTree -> Integer
treeHeight Empty        = 0
treeHeight (Node n l r) = 1 + max (treeHeight l) (treeHeight r)

data Pos = Pos Float Float
data Direction = Straight Pos Pos Pos
               | Left     Pos Pos Pos
               | Right    Pos Pos Pos
               deriving (Show)

