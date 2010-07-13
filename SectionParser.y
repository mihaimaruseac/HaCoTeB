{
module SectionParser where

import Debug.Trace
}

%name sectionParser
%tokentype { SectionToken }
%error { sectionParseError }

%token
  text { SectionTokenText $$ }
  '[' { SectionTokenStart }
  ']' { SectionTokenEnd }

%%

File  : Text SectionList { (ImplicitSection $1) : $2 }
      | SectionList { $1 }

SectionList : SectionName Text { [CompleteSection $1 $2] }
            | SectionList SectionName Text { (CompleteSection $2 $3) : $1 }

SectionName : '[' Text ']' { $2 }

Text : text { $1 }

{
sectionParseError :: [SectionToken] -> a
sectionParseError _ = error "Section Parse error"

type File = [Section]

data Section
  = ImplicitSection Text
  | CompleteSection Text Text
  deriving Show

type Text = String

data SectionToken 
  = SectionTokenStart
  | SectionTokenEnd
  | SectionTokenText String
  | SectionTokenHeader String
  deriving Show

lexer :: String -> [SectionToken]
lexer [] = []
lexer ('[':cs) = trace (show $ (part, rest)) $(parseSectionName part) : lexer rest
  where
    (part, rest) = span (/= '\n') cs
lexer cs = trace (show $(part, rest)) $undefined
  where
    (part, rest) = span (/

parseSectionName "" = error "Invalid section header"
parseSectionName text = if sep == ']' then SectionTokenHeader content 
  else error "Invalid section header"
  where
    content = init text
    sep = last text
}
