module CodeParser (representCode) where

import Text.Html

import DataDefs

{-
  Represents one section of text as an HTML fragment.
-}
representCode :: Content -> HeaderName -> HeaderExtra -> Html
representCode c _ _ = 
  thecode ! [thestyle "text-align: left-align;"] <<
  stringToHtml (init.unlines $ c)


