{-
This module contains definitions for HaCoTeB types: AST nodes and other
intermediate data structures
-}

module HaCoTeB.Types where

data AST
  = Section Content
  | CodeSection Content
  deriving (Eq, Show, Read)

data Content
  = SimpleContent String
  deriving (Eq, Show, Read)

