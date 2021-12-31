newtype Parser a = Parser { runParser :: String -> Maybe (a, String)}

instance Functor Parser where
  fmap f (Parser x) = Parser $ \s -> do
    (x', s') <- x s 
    return (f x', s')

instance Applicative Parser where 
  pure x = Parser $ \s -> Just (x, s)

  (Parser f) <*> (Parser x) = Parser $ \s -> do
    (f', s1) <- f s 
    (x', s2) <- x s1
    return (f' x', s2)

main :: IO ()
main = putStrLn "Hello, Parser"
