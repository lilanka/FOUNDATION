import System.IO
import Control.Monad
import System.Environment
import Data.List

main :: IO ()
main = do
    args <- getArgs                     -- get source file name
    let list = []
    handle <- openFile args ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = f singlewords
    print list
    hClose handle

f :: [String] -> [Int]
f = map read
