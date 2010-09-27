module CodeParser (representCode) where

import DataDefs

{-
  Represents one section of text as an HTML fragment.
-}
representCode :: Content -> HeaderName -> HeaderExtra -> FilePartRepr
representCode c _ _ = Decorated Code $ Only $ unlines c
--    thecode ! [thestyle "text-align: left-align;"] << 
--    linesToHtml c

