module TextParser (representText) where

import Text.Html

import DataDefs

{-
  Represents one section of text as an HTML fragment.
-}
representText :: Content -> HeaderName -> HeaderExtra -> Html
representText c _ _ = 
  p ! [thestyle "text-align: justify;"] <<
  stringToHtml (init.unlines $ c)

