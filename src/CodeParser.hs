module CodeParser (representCode) where

import DataDefs

{-
  Represents one section of text as an HTML fragment.
-}
representCode :: Content -> HeaderName -> HeaderExtra -> ReprTree
representCode c _ _ =  CodeNode $ map Element c

