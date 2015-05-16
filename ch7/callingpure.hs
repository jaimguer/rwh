-- Show will take a Showable thing and turn it into a string
-- This merely creates the string that will be printed.  The actual effect
-- happens within main
name2reply :: String -> String
name2reply name = "Pleased to meet you, " ++ name ++ ".\n" ++
                  "Your name contains " ++ charcount ++ " characters."
                  where charcount = show (length name)

main :: IO ()
main = do
       putStrLn "Greetings once again. What is your name?"
       -- <- gets the results of IO actions
       -- let holds the results of pure code
       inpStr <- getLine
       let outStr = name2reply inpStr
       putStrLn outStr
