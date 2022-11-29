module Lib
  ( evaluateCommandWithLabel
  , configurationMap
  , createAndWriteFile
  ) where

import qualified Data.Foldable as F
import qualified Data.Map as M
import System.Directory
import System.Process

evaluateCommandWithLabel :: M.Map String String -> String -> IO ()
evaluateCommandWithLabel m s = F.forM_ command callCommand
  where
    command = commandWithLabel m s

commandWithLabel :: M.Map String String -> String -> Maybe String
commandWithLabel m l = M.lookup l m

configurationMap :: FilePath -> IO (M.Map String String)
configurationMap path =
  readFile path >>=
  (return . M.fromList) . map ((\w -> (head w, last w)) . words) . lines

createAndWriteFile :: FilePath -> FilePath -> String -> IO ()
createAndWriteFile dirPath absoluteFilePath content = do
  createDirectoryIfMissing True dirPath
  writeFile absoluteFilePath content
