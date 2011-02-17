{-
This module offers an uniform interface to the parsing part of the HaCoTeB
project. Edit this file when defining a new parser and construct it's code in
the appropriate file.
-}

module HaCoTeB.Parse
  ( parse
  ) where

import Debug.Trace
import Control.Monad.Reader (join)
import Data.List (isPrefixOf)

import HaCoTeB.Types

import HaCoTeB.Parse.BasicParse
import HaCoTeB.Parse.SimpleTextParser

parse :: [String] -> Section
parse = join selectParser

{-
Select a parser based on the section command header (first lines of seaction,
starting with % on the first column). If you really want to include a % at the
beginning of section which shouldn't be treated as a command header, put a
space in front of it, it will be ignored, if the output generator is
consistently written.

NOTE: Please change this function when implementing a new parser to enable
dispatching to your own parser.

NOTE: The first argument is really the entire section, not the heading or
something else.
-}
selectParser :: [String] -> ([String] -> Section)
selectParser [] = basicParse -- empty section, if ever
selectParser sectionText@(h:_) = case h of
  "%text" -> simpleTextParser
  '%':_ -> trace (show$sectionText) $ error "No other parser defined yet"
  _ -> basicParse

