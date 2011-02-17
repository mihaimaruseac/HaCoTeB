{
{-
This module offers a simple text parser. It is able to recognize italic text
(enclosed by //), bold text (**), underlined text (__) and stroked-out text
(--) (and others, see below). It is created as a specification for the Alex
scanner generator and it is provided as an example on how to create a new
parser using a scanner generator, Alex in particular.
-}
module HaCoTeB.Parse.SimpleTextParser
  ( simpleTextParser
  ) where

import Debug.Trace

import HaCoTeB.Types
}

-- the monadUserState allows for a monadic parser with user data
%wrapper "monadUserState"

-- $digit = 0-9
-- $alpha = [a-zA-Z]
-- $printable

-- specify tokens and actions here, just like you'd do in Lex and Flex
tokens :-

-- where { \(pos,prev,str) len -> Alex Token } --monadic code
[^\/]+ { \(_,_,s) l -> token Text [] s }--do return $ Text [] $ take l s  }
-- \/{2} { \(_,_,s) l -> do return $ Text [Italic] $ take l s }
-- <italic> [^\/]+ { \s -> Text [] $ "sss" ++ s }
-- <italic> \/{2} { begin 0 "" }

{
{-
You can define your own data format here but your main function should ALWAYS
return a Section, thus a conversion is a MUST.

Although we could have easily produced a HaCoTeB.Types.FormattedContent value
for our Section, a new data structure was defined because alexEOF (see below)
must also return a token.
-}
data Token
  = Text [Format] String
  | EOF
  deriving (Eq, Show)

simpleTextParser :: [String] -> Section
simpleTextParser content = trace (show $ r content) $ TextSection . SimpleContent $ ""

r content = flip runAlex alexMonadScan . unwords . tail $ content

{-
Because we use monadUserState we have to provide some more definitions
here. We'll start with the data in user state (AlexUserState and
alexInitUserState) and will end with action to be taken when EOF is matched
(alexEOF). All of them must be defined before the compilation can succeed.
-}
type AlexUserState = [Format]

alexInitUserState = []

{-
Remember that this function must also return a token!!
-}
alexEOF :: Alex Token
alexEOF = return EOF
--return ([] :: [Token]) --return (Text [] "Done") --undefined --[] -- do nothing

f = undefined
}

