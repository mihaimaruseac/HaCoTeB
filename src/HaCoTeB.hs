{-
This is an umbrella module reexporting the HaCoTeB.* submodules to allow a
more simple import in other programs using this module (if any) or in testing
code. It also defines the HaCoTeB pipeline in the convert function.
-}

module HaCoTeB
  ( module HaCoTeB.Options
  , module HaCoTeB.Output
  , module HaCoTeB.Parse
  , module HaCoTeB.Splitter
  , module HaCoTeB.Types
  , convert
  ) where

import HaCoTeB.Options (Options(..), options)
import HaCoTeB.Output (output)
import HaCoTeB.Parse (parse)
import HaCoTeB.Splitter (split)
import HaCoTeB.Types

convert file = do
  s <- readFile file
  let sections = map parse . split $ s
  let ast = combine sections
  let out = output ast
  print $ out

combine :: [Section] -> AST
combine = AST

