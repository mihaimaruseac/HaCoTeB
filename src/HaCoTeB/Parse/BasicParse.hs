{-
This module offers a basic parse for the HaCoTeB project. It will create one
single AST node from the entire section containing all the text with no
mark-up and no formatting. Useful for debugging and as a safe fallback.
-}

module HaCoTeB.Parse.BasicParse (basicParse) where

import HaCoTeB.Types

basicParse = Section . SimpleContent

