naught :: [()]
naught =[]

next :: [()] -> [()]
next lst =lst ++ [()] 

combine :: ([()],[()]) -> [()]
combine (x,y) =x ++ y  

count :: [()] -> Int
count x =   length x


every_other :: String -> String
every_other x = if null x then []
                else if (null (tail x)) then [head x] 
                else [(head x)]++(every_other (tail(tail x))) 

sorted :: [Int] -> Bool
sorted x =  if  null x then True
            else if null (tail x) then True
            else if (head x) <= head (tail x) then sorted (tail x)
            else False