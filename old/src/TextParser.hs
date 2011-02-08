module TextParser (representText) where

import DataDefs

import Debug.Trace

{-
  Represents one section of text.
-}
representText :: Content -> HeaderName -> HeaderExtra -> ReprTree
representText c _ _ =  TextNode $ map parseLine c

parseLine :: String -> ReprTree
parseLine line
  | null extra = Element line
  | otherwise = Node [Element first, Bracket, parseLine $ tail extra]
  where
    (first, extra) = span (/= '[') line

test = ["test","test1","[code]", "longer line with [code] in the middle"] :: Content

