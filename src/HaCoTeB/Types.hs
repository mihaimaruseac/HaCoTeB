{-
This module contains definitions for HaCoTeB types: AST nodes and other
intermediate data structures
-}

module HaCoTeB.Types where

newtype AST = AST [Section] deriving (Eq, Show, Read)

data Section
  = TextSection Content
  | CodeSection Content
  | DecoratedSection [Decoration] Content
  deriving (Eq, Show, Read)

data Decoration
  = Alignment Align
  | ColorDec String
  | PreformattedDec
  | Heading Int
  deriving (Eq, Show, Read)

data Align
  = Center
  | Full
  | RightAllign
  | LeftAllign
  deriving (Eq, Show, Read)

data Content
  = SimpleContent String
  | FormattedContent [Format] String
  | MixedContent [Content]
  deriving (Eq, Show, Read)

data Format
  = Bold
  | Italic
  | Underline
  | Strikeout
  | Preformatted
  | Color String
  deriving (Eq, Show, Read)

