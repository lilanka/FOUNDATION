{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment
import Data.List

import Scanner 

main :: IO ()
main = do 
      args <- getArgs
      lexer args
