
data Op = Plus | Minus | Mul | Div | Pow
        deriving (Eq, Show)

data SymbolicManip a = Number a
                     | Symbol String
                     | BinaryArith Op (SymbolicManip a) (SymbolicManip a)
                     | UnaryArith String (SymbolicManip a)
                     deriving (Eq)

instance Num a => Num (SymbolicManip a) where
    a + b         = BinaryArith Plus a b
    a - b         = BinaryArith Minus a b
    a * b         = BinaryArith Mul a b
    negate a      = BinaryArith Mul (Number (-1)) a
    abs a         = UnaryArith "abs" a
    signum _      = error "signum undefined"
    fromInteger i = Number (fromInteger i)

instance Fractional a => Fractional (SymbolicManip a) where
    a / b          = BinaryArith Div a b
    recip a        = BinaryArith Div (Number 1) a
    fromRational r = Number (fromRational r)

instance Floating a => Floating (SymbolicManip a) where
    pi     = Symbol "pi"
    exp a  = UnaryArith "exp" a
    log a  = UnaryArith "log" a
    sqrt a = UnaryArith "sqrt" a
    a ** b = BinaryArith Pow a b

prettyShow :: (Show a, Num a) => SymbolicManip a -> String
prettyShow (Number n) = show n
prettyShow (Symbol s) = s
prettyShow (BinaryArith op a b) =
    let pa  = simpleParen a
        pb  = simpleParen b
        pop = op2str op
        in pa ++ pop ++ pb

op2str :: Op -> String
op2str Plus  = "+"
op2str Minus = "-"
op2str Mul   = "*"
op2str Div   = "/"
op2str Pow   = "**"

simpleParen :: (Show a, Num a) => SymbolicManip a  -> String
simpleParen (Number n)            = prettyShow (Number n)
simpleParen (Symbol s)            = prettyShow (Symbol s)
simpleParen x@(BinaryArith _ _ _) = "(" ++ prettyShow x ++ ")"
simpleParen x@(UnaryArith _ _)    = prettyShow x

instance (Show a, Num a) => Show (SymbolicManip a ) where
    show a = prettyShow a
