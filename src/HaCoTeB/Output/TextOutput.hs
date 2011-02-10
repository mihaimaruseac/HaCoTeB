{-
This module offers a basic output printer for the HaCoTeB project. It will
print everything as a text file with no formatting. Useful for debugging and
as a safe fallback.
-}

module HaCoTeB.Output.TextOutput (textOutput) where

import HaCoTeB.Types

textOutput :: AST -> String
textOutput (AST a) = repr a

{-
Ignore everything, print only the text.
-}
repr :: [Section] -> String
repr = tail . tail . concatMap repr'
  where
    repr' (TextSection s) = '\n' : '\n' : repr'' s
    repr' (CodeSection s) = '\n' : '\n' : repr'' s
    repr'' (SimpleContent s) = s

