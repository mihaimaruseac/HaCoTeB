module HaCoTeB where

import Debug.Trace

-- Section datatype
data Section = Complete String String deriving Show

-- Section parser
getSections :: String -> [Section]
getSections text = trace (show a) undefined
  where
    a = lines text

test = "terminator\n[header1]\ntext1\nterminator\n[header2]\ntext2"

