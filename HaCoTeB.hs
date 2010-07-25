module HaCoTeB where

import Data.List
import Debug.Trace

-- Section datatype
data Section 
  = Anon String
  | Complete String String
  | Empty
  deriving (Show, Eq)

-- Second level parser call

{-
  Parses the file content and returns its HTML representation.
  Uses representSection and getSections.
  Filters the Empty sections before passing them to the HTML generators.
-}
representFileContent :: String -> [String]
representFileContent = representSections . filter (/= Empty) . getSections
  where
    representSections = map representSection

{-
  Takes one section and passes it to the corresponding HTML generator to
  obtain the HTML representation. If something is wrong with the header
  throws and exception.
-}
representSection :: Section -> String
representSection (Anon _) = "text"
representSection (Complete ('[':h) _)
  | null extra = error ("Incomplete header" ++ " [" ++ h)
  | headerID `isPrefixOf` "text" = "text" ++ name
  | headerID `isPrefixOf` "code" = "code" ++ name
  | otherwise = error ("Invalid header" ++ " [" ++ h)
    where
      (header_data, extra) = span (/= ']') h
      (headerID, name) = span (/= ':') header_data

-- Section parser

{-
  Parse the text and return a list of its Section. Uses splitSections and
  createSection.
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
  | head header == '[' = Complete header (unlines content)
  | otherwise = Anon (unlines text)
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

