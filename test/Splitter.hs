{-
This will test HaCoTeB.Splitter module.
-}

import System.Exit

import HaCoTeB.Splitter

testSimple = do
  s <- readFile "examples/1.txt"
  let sections = split s
  putStr "Testing 1.txt:"
  if length sections /= 3 
    then putStrLn "\t\tFAILED"
    else putStrLn "\t\tPASSED"

main = do
  testSimple

