module HaCoTeB where

-- Section datatype
data Section 
  = NoHead String
  | Complete String String
  deriving Show

-- Section parser
getSections :: String -> [Section]
getSections = undefined

