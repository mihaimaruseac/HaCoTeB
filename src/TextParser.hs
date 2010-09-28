module TextParser (representText) where

import DataDefs

{-
  Represents one section of text.
-}
representText :: Content -> HeaderName -> HeaderExtra -> ReprTree
representText c _ _ =  TextNode $ map Element c

