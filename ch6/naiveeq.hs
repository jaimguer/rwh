-- Typeclasses

data Color = Red | Green | Blue

colorEq :: Color -> Color -> Bool
colorEq Red Red     = True
colorEq Green Green = True
colorEq Blue Blue   = True
colorEq _ _         = False

stringEq :: [Char] -> [Char] -> Bool
stringEq [] []         = True
stringEq (x:xs) (y:ys) = (x == y) && stringEq xs ys
stringEq _      _      = False

-- Writing equality checks for each type of data is lame

-- these `class` words define a typeclass
-- when we implement their functions, we define instances of the typeclass
class BasicEq a where
    isEqual :: a -> a -> Bool

class BasicEq2 a where
    isEqual2    :: a -> a -> Bool
    isNotEqual2 :: a -> a -> Bool

class BasicEq3 a where
    isEqual3 :: a -> a -> Bool
    isEqual3 x y = not (isNotEqual3 x y)

    isNotEqual3 :: a -> a -> Bool
    isNotEqual3 x y = not (isEqual3 x y)

instance BasicEq3 Color where
    isEqual3 Red Red     = True
    isEqual3 Green Green = True
    isEqual3 Blue Blue   = True
    isEqual3 _ _         = False

-- We can define show instances for our own types through instance
instance Show Color where
    show Red   = "Red"
    show Blue  = "Blue"
    show Green = "Green"
