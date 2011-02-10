{-
This module offers a basic parse for the HaCoTeB project. It will create one
single AST node from the entire section containing all the text with no
mark-up and no formatting. Useful for debugging and as a safe fail-back.
-}

module HaCoTeB.Parse.BasicParse where

import HaCoTeB.Types

basicParse _ = Node
