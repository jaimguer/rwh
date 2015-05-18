myLookup :: Eq a => a -> [(a,b)] -> Maybe b
myLookup _ [] = Nothing
myLookup k ((key, value) :: rest) =
    if k == key then Just value else myLookup k rest
