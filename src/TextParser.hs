module TextParser (representText) where

import DataDefs

{-
  Represents one section of text.
-}
representText :: Content -> HeaderName -> HeaderExtra -> FilePartRepr
representText c _ _ = Only (unwords c)
--  p ! [thestyle "text-align: justify;"] <<
--  stringToHtml (init.unlines $ c)

