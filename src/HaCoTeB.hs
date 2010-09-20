module HaCoTeB (representFileContent) where

import Data.List
import Text.Html

import DataDefs
import TextParser
import CodeParser

-- This is where the entire job is being done.
{-
  Parses the file content and returns its HTML representation.
  Filters the Empty sections before passing them to the HTML generators.
-}
representFileContent :: String -> String
representFileContent = 
  prettyHtml . 
  concatHtml . 
  map representSection .
  filter (/= Empty) . 
  getSections

-- Second level parser call
{-
  Takes one section and passes it to the corresponding HTML generator to
  obtain the HTML representation. If something is wrong with the header
  throws an exception.
-}
representSection :: Section -> Html
representSection (Anon t) = representText t "" ""
representSection (Complete ('[':h) t)
  | null extra = error ("Incomplete header" ++ " [" ++ h)
  | headerID `isPrefixOf` "text" = representText t name extra
  | headerID `isPrefixOf` "code" = representCode t name extra
  | otherwise = error ("Invalid header" ++ " [" ++ h)
    where
      (header_data, extra) = span (/= ']') h
      (headerID, name) = span (/= ':') header_data

-- Section parser
{-
  Parse the text and return a list of its Section. 
-}
getSections :: String -> [Section]
getSections text = map createSection $ splitSections (head ls) ls
  where
    ls = lines text

{-
  Create a Section from a list of strings. If first string seems to be a
  header construct a Complete section, otherwise an Anonymous one. If
  the list is empty, construct an Empty section.
-}
createSection :: [String] -> Section
createSection text@(header:content)
  | head header == '[' = Complete header content
  | otherwise = Anon text
createSection [] = Empty

{-
  Split the stream of lines from the file into a list of list of lines.
  The delimiter is the first argument of the function and it will not
  appear on the output.
-}
splitSections :: String -> [String] -> [[String]]
splitSections _ [] = []
splitSections end (_:content) = section : splitSections end sections
  where
    (section, sections) = span (/= end) content

