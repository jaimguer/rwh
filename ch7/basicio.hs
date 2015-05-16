
-- putStrLn puts a newline at the end of the output
-- putStr does not
main = do
       writefoo <- putStrLn "Greetings! What is your name?"
       inputStr <- getLine
       putStrLn $ "Welcome to Haskell, " ++ inputStr ++ "!"

-- Things of the type /IO something/ are IO actions.
-- IO actions produce an effect when performed but not when evaluated.   This is
-- why I can bind (putStrLn "foo") to a variable, and not have "foo" printed
