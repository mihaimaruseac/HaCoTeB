{-
This module offers an uniform interface to the parsing part of the HaCoTeB
project. Edit this file when defining a new parser and construct it's code in
the appropriate file.
-}

module HaCoTeB.Parse
  ( parse
  ) where

import Control.Monad.Reader (join)

import HaCoTeB.Types

import HaCoTeB.Parse.BasicParse

{-
This function is still in the IO monad because we allow some parsers to read
other files.
-}
parse :: String -> AST
parse = join selectParser

{-
Select a parser based on the section command header (text contained between
the first % and the next % markers, at the beginning of the section. If you
really want to include a % at the beginning of section which shouldn't be
treated as a command header, put a space in front of it, it will be ignored.

NOTE: Please change this function when implementing a new parser to enable
dispatching to your own parser.
-}
selectParser :: String -> (String -> AST)
selectParser ('%':_) = error "No specific parser defined yet"
selectParser _ = basicParse

