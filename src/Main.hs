{-
This is the Main module for the HaCoTeB project. It is separated from the
HaCoTeB module to allow for later reuse and to differentiate between the tool
and its usage.
-}

{-# LANGUAGE RecordWildCards #-}

module Main where

import System.Console.CmdArgs

import HaCoTeB

main = do
  Options {..} <- cmdArgs options -- as defined in HaCoTeB.Options
  print files

