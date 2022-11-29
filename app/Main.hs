module Main
  ( main
  ) where

import Lib
import System.Directory

main :: IO ()
main = do
  homeDir <- getHomeDirectory
  -- Path to configuration file
  let dirPath = homeDir ++ "/.config/jmp/"
  let absoluteFilePath = dirPath ++ "jmp.list"
  fileExists <- doesFileExist absoluteFilePath
  -- Only act if file exists
  if fileExists
      -- Get the configuration and execute the given command if possible
    then do
      config <- configurationMap absoluteFilePath
      evaluateCommandWithLabel config "demo"
    else do
      putStrLn $ "No config file found. Creating one in " ++ dirPath
      createAndWriteFile dirPath absoluteFilePath "demo ls"
      putStrLn
        "New config file was created! Use `jmp demo` to execute the demo command: `ls`"
