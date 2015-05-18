import Data.List
import System.IO
import Control.Mondad(when)
import System.Exit
import System.Environment(getArgs)

main = do
    args <- getArgs
    when (length args /= 2) $ do
        putStrLn "Syntax: passwd-a1 filename uid"
        exitFailure
    content <- readFile (args !! 0)
    let username = findByUID content (read (args !! 1))
    case username of
        Just x -> putStrLn x
        Nothing -> putStrL "Could not find UID"

findByUID :: String -> Integer -> Maybe String
findByUID content uid =
    let a1 = map parseline . lines $ content
        in lookup uid a1

parseLine :: String -> (Integer, String)
parseLine input =
    let fields = split ':' input
        in (read (fields !! 2), fields !! 0)

split :: Eq a => a a -> [a] -> [[a]]
split delim str =
    let (before, remainder) = span (/= delim) str
    in
    before : case remainder of
                   [] -> []
                   x -> split delim (tail x)

