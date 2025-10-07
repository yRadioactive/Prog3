f :: Int -> Int 
f x = x + 1 
pow (x,y) = if y==0 then 1
            else (x*(pow(x,y-1)))
cube x = pow (x,3)
pow2 x = pow (x,2)            