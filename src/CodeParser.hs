module CodeParser (representCode) where

import Data.List
import Text.Html

import DataDefs

import Debug.Trace

{-
  Represents one section of text as an HTML fragment.
-}
representCode :: Content -> HeaderName -> HeaderExtra -> Html
representCode c _ _ = 
    thecode ! [thestyle "text-align: left-align;"] << 
    linesToHtml c

