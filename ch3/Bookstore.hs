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

data BookReview = BookReview BookInfo CustomerID String

-- the type keyword makes CustomerId synonymous with Int
type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

-- BookRecord is a synonym for the tuple (BookInfo, BookReview)
type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address    = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

-- Record syntax allows us to define both the value constructor and its accessor
-- methods at the same time.
-- CustomerID is the type that goes as the first argument of Customer, and the
-- accessor function is called customerID
data Customer = Customer {
                customerID      :: CustomerID
              , customerName    :: String
              , customerAddress :: Address
              } deriving (Show)


