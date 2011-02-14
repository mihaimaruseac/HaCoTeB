{-
This module offers an uniform interface to the parsing part of the HaCoTeB
project. Edit this file when defining a new parser and construct it's code in
the appropriate file.
-}

module HaCoTeB.Parse
  ( parse
  ) where

import Control.Monad.Reader (join)
import Data.List (isPrefixOf)

import HaCoTeB.Types

import HaCoTeB.Parse.BasicParse

parse :: String -> Section
parse = join selectParser

{-
Select a parser based on the section command header (text contained between
the first % and the next % markers, at the beginning of the section. If you
really want to include a % at the beginning of section which shouldn't be
treated as a command header, put a space in front of it, it will be ignored,
if the output generator is consistently written.

NOTE: Please change this function when implementing a new parser to enable
dispatching to your own parser.

NOTE: The first argument is really the entire section, not the heading or
something else.
-}
selectParser :: String -> (String -> Section)
selectParser [] = basicParse -- empty section, if ever
selectParser sectionText = case title of
  "%text" -> error "simpleTextParser"
  '%':_ -> error "No other parser defined yet"
  _ -> basicParse
  where
    title = head . lines $ sectionText

