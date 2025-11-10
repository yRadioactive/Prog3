{- Codevorlage zum 7. Foliensatz: Arithmetische Ausdrücke
   Alternative Programmierparadigmen 2025
   Prof. Baltasar Trancón Widemann -}

data Expr = Constant Int
          | Neg Expr
          | Add Expr Expr
          | Mult Expr Expr
  deriving (Eq, Show)


eval :: Expr -> Int
eval e = case e of
  Constant c -> c
  Neg a      -> -(eval a)
  Add a b    -> eval a + eval b
  Mult a b   -> eval a * eval b
  

toString :: Expr -> String
toString e = case e of
  Constant c -> show c
  Neg  a     -> "- " ++ toStringNeg a
  Add  a b   -> toString a ++ plus ++ toString b
                  where plus = case b of
                          Neg _ -> " "
                          _     -> " + "
  
  Mult a b -> toString a ++ plus ++ toString b
                  where plus = case b of
                          Neg _ -> " "
                          _     -> " * "
  where
    toStringNeg e = case e of
      Constant _ -> toString e
      _   -> "(" ++ toString e ++ ")"

hasZero :: Expr -> Bool
hasZero e = case e of
  Constant c -> c == 0
  Neg a      -> hasZero a
  Add a b    -> hasZero a || hasZero b
  Mult a b -> hasZero a || hasZero b

noNegConstants :: Expr -> Expr
noNegConstants e = case e of
  Constant c -> if c < 0 then Neg(Constant (abs c))
                else Constant c  
                
  Neg c -> Neg (noNegConstants c)

  Add a b -> Add (noNegConstants a) (noNegConstants b) 
  Mult a b -> Mult (noNegConstants a) (noNegConstants b)



  --habs im Endeffekt nur für Hs gemacht. Dort war die neue Funktion aufwändiger als die Datenvariante. Ich kann mir vorstellen dass es bei ähnlich ist. jedoch bei hs einfacher