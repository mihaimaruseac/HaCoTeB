{
  module SectionParser where
}

%name sectionParser
%tokentype {[SectionToken]}
%error {sectionParseError}
%
%token
  '[' { SectionTokenStart }
  ']' { SectionTokenEnd }

%%

File  : Text SectionList { $1 : $2 }
      | SectionList { $1 }

SectionList : SectionName Text { [Section $1 $2] }
            | SectionList SectionName Text { (Section $2 $3) : $1 }

SectionName = SectionTokenStart Text SectionTokenEnd { SectionName $2 }

Text?

{
  sectionParseError :: [SectionToken] -> a
  sectionParseError _ = error "Section Parse error"
}
