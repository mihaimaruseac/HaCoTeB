module HaCoTeB where

import Debug.Trace

-- Section datatype
data Section 
  = Anon String
  | Complete String String
  deriving Show

-- Section parser

{-
  Parse e text and return a list of its Section. Uses splitSections and
  createSection.
-}
getSections :: String -> [Section]
getSections text = map createSection $ splitSections (head ls) ls
  where
    ls = lines text

{-
  Create a Section from a list of strings. If first string seems to be a
  header construct a Complete section, otherwise an Anonymous one.
-}
createSection :: [String] -> Section
createSection text@(header:content)
  | head header == '[' = Complete header (unlines content)
  | otherwise = Anon (unlines text)

{-
  Split the stream of lines from the file into a list of list of lines.
  The delimiter is the first argument of the function and will not
  appear on the output.
-}
splitSections :: String -> [String] -> [[String]]
splitSections _ [] = []
splitSections end (_:content) = section : (splitSections end sections)
  where
    (section, sections) = span (/= end) content

test = "terminator\n[header1]\ntext1\nterminator\nanon\n[header2]\ntext2"

