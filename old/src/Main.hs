module Main where

import HaCoTeB

main = do
  s <- readFile "test"
  writeFile "test.html" $ convert s
