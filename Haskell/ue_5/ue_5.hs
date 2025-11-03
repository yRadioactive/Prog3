data XInteger = PosInfinity
                | Finite Integer
                | NegInfinity

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
    show (Finite a) = show n 





