module Main where

import HaCoTeB

main = do
  s <- readFile "test"
  print $ getSections s
