module Scanner (lexer) where

import System.IO
import Control.Monad

lexer fname = rf fname

rf fname = do
        contents <- readFile fname 
        print . map readInt . words $ contents

readInt :: String -> Int
readInt = read
