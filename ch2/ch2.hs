add a b = a + b

lastButOne :: [a] -> a
lastButOne l = if null $ (tail . tail) l
                then (head l)
                else lastButOne $ tail l

lastButOneL :: [a] -> a
lastButOneL  = \ l -> if null $ (tail . tail) l
                      then (head l)
                      else lastButOne $ tail l
