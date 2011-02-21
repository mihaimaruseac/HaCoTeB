{-
This module offers a basic HTML output printer for the HaCoTeB project. It can
be extended freely if another HTML output is desirable (for example, if we
need to avoid Wordpress' [..] tags.
-}

module HaCoTeB.Output.HTMLOutput
  ( htmlOutput
  ) where

import Text.Html

import HaCoTeB.Types

htmlOutput :: AST -> String
htmlOutput (AST a) = prettyHtml $ repr a

repr :: [Section] -> Html
repr = error "Not defined yet"


