module Lib
    ( evaluateCommandWithLabel
    ) where

import System.Process
import qualified Data.Map as M
import qualified Data.Foldable as F

evaluateCommandWithLabel :: M.Map String String -> String -> IO ()
evaluateCommandWithLabel m s = F.forM_ command callCommand
    where 
        command = commandWithLabel m s

commandWithLabel :: M.Map String String -> String -> Maybe String
commandWithLabel m l = M.lookup l m
