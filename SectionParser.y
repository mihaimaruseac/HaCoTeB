{
  module SectionParser where
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
  deriving Show
}
