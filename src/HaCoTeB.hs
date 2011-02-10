{-
This is an umbrella module reexporting the HaCoTeB.* submodules to allow a
more simple import in other programs using this module (if any).
-}

module HaCoTeB
  ( module HaCoTeB.Options
  , module HaCoTeB.Splitter
  ) where

import HaCoTeB.Options
import HaCoTeB.Splitter

