module Main where

import HaCoTeB

main = do
  s <- readFile "test"
  writeFile "test.html" $ fileToHtml s
