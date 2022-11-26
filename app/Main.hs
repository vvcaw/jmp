module Main (main) where

import Lib
import Data.Map

main :: IO ()
main = evaluateCommandWithLabel (fromList [("list", "ls")]) "list"
