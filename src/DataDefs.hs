module DataDefs where

-- Section datatype
data Section
  = Anon Content
  | Complete String Content
  | Empty
  deriving (Show, Eq)

-- Representation of file content
data ReprTree
  = Element String
  | SectionNode [ReprTree] -- a list of sections
  | CodeNode [ReprTree]
  | TextNode [ReprTree]
  deriving (Show)

-- content of sections
type Content = [String]

-- section header name
type HeaderName = String

-- section header extra data
type HeaderExtra = String

