{-
This module contains the command line arguments that can be given to HaCoTeB.
If someone will want to extend them for another project which uses HaCoTeB she
can freely do so either here or by importing this module and constructing a
more general CmdArgs data type structure.
-}

{-# LANGUAGE DeriveDataTypeable #-}

module HaCoTeB.Options where

import System.Console.CmdArgs

{-
Command line arguments as a data type.
-}
data Options = Options
  { files :: [FilePath]
  } deriving (Show, Data, Typeable)

{-
Command line arguments for the entire HaCoTeB (all stages of pipeline).
-}
options = Options
  { files = def &= args &= typ "FILES"
  }
  &= summary "HaCoTeB (C) Mihai Maruseac 2011"
  &= help ("Constructs one simple output file from an input file containing"
  ++ " text and code markup. Useful for blogging or other activities.")
  &= details ["Details: TODO"]
  &= program "hctb"

