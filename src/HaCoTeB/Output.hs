{-
This module offers an uniform API to the output formats that HaCoTeB offers.
When implementing a new output printer change this file and implement the rest
of the code in the appropriate file.
-}

module HaCoTeB.Output
  ( output
  ) where

import HaCoTeB.Types

import HaCoTeB.Output.TextOutput
import HaCoTeB.Output.HTMLOutput

output :: AST -> String
output = selectOutput

selectOutput :: AST -> String
selectOutput = htmlOutput

