data IntList = Empty
            | Cons (Int,IntList)
            

l1 = Cons(7, Cons(1, Cons(3, Empty))) :: IntList

tertium :: IntList ->  Int
tertium Empty = 0
tertium (Cons (_, Empty)) = 0
tertium (Cons (_, Cons (_, Empty))) = 0
tertium (Cons (_, Cons (_, Cons (x, _)))) = x


