module DataDefs where

-- content of sections
type Content = [String]

-- section header name
type HeaderName = String

-- section header extra data
type HeaderExtra = String

-- Section datatype
data Section 
  = Anon Content
  | Complete String Content
  | Empty
  deriving (Show, Eq)

