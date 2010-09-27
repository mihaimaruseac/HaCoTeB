module DataDefs where

-- Section datatype
data Section
  = Anon Content
  | Complete String Content
  | Empty
  deriving (Show, Eq)

-- Representation of a part of file content
data FilePartRepr
  = Only String
  | Decorated Decoration FilePartRepr
  deriving (Show)

-- Possible decorations of text
data Decoration
  = Code
  deriving (Show)

-- Representation of file content
type FileRepr = [FilePartRepr]

-- content of sections
type Content = [String]

-- section header name
type HeaderName = String

-- section header extra data
type HeaderExtra = String

