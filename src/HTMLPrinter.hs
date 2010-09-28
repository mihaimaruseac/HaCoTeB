module HTMLPrinter (printHTML) where

import DataDefs

printHTML :: FileRepr -> String
printHTML = unlines . map paraTag

paraTag :: FilePartRepr -> String
paraTag (Decorated Code a) = "<code style='text-align:left'>" ++
  (content a) ++ "</code>"
paraTag a = "<p style='text-align:justify'>" ++ (content a) ++ "</p>"

content :: FilePartRepr -> String
content (Only a) = a

