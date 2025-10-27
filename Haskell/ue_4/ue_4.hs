data IntList = Empty
            | Cons (Int,IntList)
            

l1 = Cons(7, Cons(1, Cons(3, Empty))) :: IntList

tertium :: IntList ->  Int
tertium Empty = 0
tertium (Cons (_, Empty)) = 0
tertium (Cons (_, Cons (_, Empty))) = 0
tertium (Cons (_, Cons (_, Cons (x, _)))) = x




sumpairs :: [(Int,Int)] -> Int 
sumpairs [] = 0
sumpairs ((a,b): xs) = a+b+sumpairs xs


firsts :: [(Int,Int)] -> [Int]
firsts [] = []
firsts ((a,_):xs) = a : firsts xs 

seconds :: [(Int,Int)] -> [Int]
seconds [] = [] 
seconds ((_,b):xs) = b : seconds xs 

sumpairs2 :: [(Int,Int)] -> Int 
sumpairs2 [] = 0
sumpairs2 ((a,b)) = 0 -- weiter machen






