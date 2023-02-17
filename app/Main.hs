module Main where

import StackMachine

main :: IO ()
main = do
    input <- getLine
    let result = run input
    print result