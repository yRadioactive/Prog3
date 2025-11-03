data XInteger = PosInfinity
                | Finite Integer
                | NegInfinity

  --  deriving (Eq, Ord, Show)

instance Eq XInteger where 
    PosInfinity == PosInfinity = True
    NegInfinity == NegInfinity = True
    Finite a == Finite b = a==b
    _==_ = False
instance Ord XInteger where 
    compare NegInfinity NegInfinity = EQ
    compare NegInfinity _ = LT
    compare _ NegInfinity = GT
    compare PosInfinity PosInfinity = EQ
    compare PosInfinity _ = GT
    compare _ PosInfinity = LT
    compare (Finite a) (Finite b) = compare a b

instance Show XInteger where 
    show PosInfinity = "Infinity" 
    show NegInfinity = "-Infinity"
    show (Finite a) = show a

instance Num XInteger where
    -- Addition
    PosInfinity + NegInfinity = Finite 0  
    NegInfinity + PosInfinity = Finite 0  
    PosInfinity + _ = PosInfinity
    NegInfinity + _ = NegInfinity
    _ + PosInfinity = PosInfinity
    _ + NegInfinity = NegInfinity
    Finite a + Finite b = Finite (a + b)

    -- Multiplication
    PosInfinity * NegInfinity = NegInfinity
    NegInfinity * PosInfinity = NegInfinity
    PosInfinity * Finite n | n > 0 = PosInfinity
                          | n < 0 = NegInfinity
                          | otherwise = Finite 0
    NegInfinity * Finite n | n > 0 = NegInfinity
                          | n < 0 = PosInfinity
                          | otherwise = Finite 0
    Finite n * PosInfinity | n > 0 = PosInfinity
                          | n < 0 = NegInfinity
                          | otherwise = Finite 0
    Finite n * NegInfinity | n > 0 = NegInfinity
                          | n < 0 = PosInfinity
                          | otherwise = Finite 0
    Finite a * Finite b = Finite (a * b)

    -- Absolute value
    abs PosInfinity = PosInfinity
    abs NegInfinity = PosInfinity
    abs (Finite n) = Finite (abs n)

    -- Sign of a number
    signum PosInfinity = Finite 1
    signum NegInfinity = Finite (-1)
    signum (Finite n) = Finite (signum n)

    -- Convert from Integer
    fromInteger n = Finite n

    -- Negation
    negate PosInfinity = NegInfinity
    negate NegInfinity = PosInfinity
    negate (Finite n) = Finite (negate n)


class Optional o where
    -- Construction
    nothing :: o a
    just :: a -> o a
    -- Access
    present :: o a -> Bool
    get :: o a -> a
    getWithDefault :: a -> o a -> a
    getWithDefault d x = if present x then get x else d
    -- Specification:
    -- present nothing == False
    -- present (just x) == True
    -- get (just x) == x

class Stack s where
    -- Construction
    empty :: s a
    push :: a -> s a -> s a
    top :: s a -> Maybe a
    pop :: s a -> Maybe (s a)
    -- Specification:
    -- pop empty == Nothing
    -- pop (push x s) == Just s
    -- top empty == Nothing
    -- top (push x s) == Just x
{-    
instance Stack [] where 
    empty = []
    push x a = x : a
    top [] = Nothing
    top (x:_) = Just x
    pop [] = Nothing 
    pop (_:xs) = Just xs 
-}

instance Stack [] where 
    empty = []
    push x a = a ++ [x]
    top [] = Nothing
    top a = Just (last a)
    pop [] = Nothing
    pop a = Just (init a) 



