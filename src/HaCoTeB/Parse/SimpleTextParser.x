{
module HaCoTeB.Parse.SimpleTextParser
  ( simpleTextParser
  ) where

import Debug.Trace

import HaCoTeB.Types
}

%wrapper "basic"

--$digit = 0-9
--$alpha = [a-zA-Z]

tokens :-

. { \s -> TODO }

{
data Token
  = TODO
  deriving (Eq, Show)

simpleTextParser = trace r undefined
  where
    r = "x"
}

