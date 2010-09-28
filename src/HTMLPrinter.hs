module HTMLPrinter (printHTML) where

import DataDefs

import Debug.Trace

printHTML :: ReprTree -> String
printHTML (SectionNode l) = unlineSons l
printHTML (TextNode l) = gPARA_START ++ (unwordSons l) ++ gPARA_STOP
printHTML (CodeNode l) = gCODE_START ++ (unlineSons l) ++ gCODE_STOP
printHTML (Element a) = a
printHTML a = trace (show a) "Not implemeneted"

concatSons = gatherFromLeaves concat
unwordSons = gatherFromLeaves unwords
unlineSons = gatherFromLeaves unlines

gatherFromLeaves :: ([String] -> String) -> [ReprTree] -> String
gatherFromLeaves f = f . (map printHTML)

-- globals section (globals only to this file, the values are not
-- exported)
gPARA_START = "<p style=\"text-align:justify\">"
gPARA_STOP = "</p>"
gCODE_START = "<pre style=\"color:#000000;background-color:#ffffff;font-size:10pt;font-family:'Courier New';\">"
gCODE_STOP = "</pre>"
