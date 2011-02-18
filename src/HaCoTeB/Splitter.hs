{-
This module contains the splitting part of the HaCoTeB project.
-}

module HaCoTeB.Splitter where

{-
Split one text file in sections. Each section is separated by an empty line.
-}
split :: String -> [[String]]
split = span' . lines
  where
    span' text = let (s, ss) = span (/= "") text
                 in if ss /= [] then s : span' (tail ss) else [s]

