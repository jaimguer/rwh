{-
 - BookInfo : type constructor
 - Book     : value constructor
 - Int      : book identifier
 - String   : title
 - [String] : authors
 -}

data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

-- A new book value looks like a function application
myInfo = Book 9870135072455 "Algebra of Programming"
        ["Richard Bird", "Oege de Moore"]

data BookReview = BookReview BookInfo CustomerID String.

-- the type keyword makes CustomerId synonymous with Int
type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody
