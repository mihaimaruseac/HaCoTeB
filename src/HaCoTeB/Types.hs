{-
This module contains definitions for HaCoTeB types: AST nodes and other
intermediate data structures
-}

module HaCoTeB.Types where

newtype AST = AST [Section] deriving (Eq, Show, Read)

data Section
  = TextSection Content
  | CodeSection Content
  deriving (Eq, Show, Read)

data Content
  = SimpleContent String
  deriving (Eq, Show, Read)

