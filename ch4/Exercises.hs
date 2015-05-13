
import Data.Char

safeHead :: [a] -> Maybe a
safeHead []       = Nothing
safeHead (x : xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail []       = Nothing
safeTail (x : xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast []       = Nothing
safeLast [x]      = Just x
safeLast (x : xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit []       = Nothing
safeInit [x]      = Just []
safeInit (x : xs) = Just (x : result)
                  where
                  Just result = safeInit xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p (x : xs) = (x : y) : splitWith p n
                     where
                     (y, n) = span (not . p) xs


asInt_fold :: String -> Int
asInt_fold []         = 0
asInt_fold ['-']      = 0
asInt_fold ('-' : xs) = negate $ asInt_fold xs
asInt_fold s          = foldl f 0 s
                      where
                      f acc x  = (10 * acc) + (ord x - ord '0')

--concat_foldr :: [[Char]] -> [Char]
concat_foldr l = foldr f [] l
               where
               f x acc = x ++ acc

takeWhile_recursion p [] = []
takeWhile_recursion p (x : xs)
    | (p x) = x : takeWhile_recursion p xs
    | otherwise = []

takeWhile_foldr p l = foldr f [] l
                    where
                    f x acc = if (p x) then x : acc else []



