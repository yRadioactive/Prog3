swap :: (Int, String) -> (String,Int)
swap (x,y) = (y,x)

add_frac :: ((Int,Int),(Int,Int)) -> (Int,Int)
add_frac ((x,y),(v,w)) = ((x*w)+(y*v),(y*w))

add_frac_cancel :: ((Int,Int),(Int,Int)) -> (Int,Int) 
add_frac_cancel ((x,y),(v,w)) = ((s `div` (gcd s t)),(t `div` (gcd s t))) 
    where   s =(x*w)+(y*v)
            t= (y*w)
