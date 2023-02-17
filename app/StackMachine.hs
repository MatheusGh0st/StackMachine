module StackMachine where

import Data.Char

type Stack = [Int]

push :: Int -> Stack -> Stack
push x stack = x : stack

pop :: Stack -> (Int, Stack)
pop (x:xs) = (x, xs)

operate :: String -> Int -> Int -> Int
operate "+" x y = x + y
operate "-" x y = x - y
operate "*" x y = x * y
operate "/" x y = x `div` y
operate _ _ _   = error "Unsupported operation"

eval :: Stack -> [String] -> Int
eval stack [] = head stack
eval stack (x:xs)
    | isDigit (head x) = eval (push (read x) stack) xs
    | otherwise        = eval (push result stack) xs
    where (b, stack2)  = pop stack
          (a, stack3)  = pop stack2
          result       = operate x a b

run :: String -> Int
run expression = eval [] (words expression)