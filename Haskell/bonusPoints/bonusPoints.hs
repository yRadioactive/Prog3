penault :: [a] -> Maybe a 
penault a = case a of
    [] -> Nothing
    [x] -> Nothing
    [x,y] -> Just x
    (x:xs) -> penault xs
    
p2nault :: [a] -> Maybe a 
p2nault a = if (null a) ==True then Nothing
            else if (null(tail a)) == True then Nothing 
            else if (null(tail(tail a)))==True then Just (head a) 
            else p2nault(tail a)  