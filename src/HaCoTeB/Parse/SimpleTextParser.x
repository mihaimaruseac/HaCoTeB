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
import Data.List (delete)

import HaCoTeB.Types
}

-- Use the HaCoTeB wrapper for best results regarding needed code vs
-- boilerplate code ratio. It allows for a monadic parser with user data, see
-- below on how to gather the data from the state (also, see documentation).
%wrapper "HaCoTeB"

-- put here all characters used to select format
$formatspec = [\*\/_\-]

-- specify tokens and actions here, just like you'd do in Lex and Flex
tokens :-

[^$formatspec]+ { takeText }
$formatspec { takeText } -- for single chars (think a * b)
\/{2} { flipFormat Italic }
\*{2} { flipFormat Bold }
_{2} { flipFormat Underline }
\-{2} { flipFormat Strikeout }

{
{-
You can define your own data format here but your main function should ALWAYS
return a Section, thus a conversion is a MUST.

Although we could have easily produced a HaCoTeB.Types.FormattedContent value
for our Section, this definition is used to demonstrate conversion between
formats.
-}
data Token
  = Text [Format] String
  deriving (Eq, Show)

simpleTextParser :: [String] -> Section
simpleTextParser input = trace (show $ p content) $ TextSection . SimpleContent $ "asdf"
  where
    content = unwords . tail $ input -- remove section header -- TODO in a better way
    p = either error convert . runAlexStr

convert = id

{-
Define user state structure and initial value.
-}
type AlexUserState = [Format]

alexInitUserState = []

{-
Token actions here. All should have the same type: Alex (Maybe Token), for
your specification of Token. Return Nothing if you want to prematurely end the
conversion (testing or real demand).
-}
takeText :: AlexInput -> Int -> Alex (Maybe Token)
takeText (_, _, s) l = do
  f <- getUserData
  return $ Just $ Text f (take l s)

flipFormat :: Format -> AlexInput -> Int -> Alex (Maybe Token)
flipFormat format i l = do
  f <- getUserData
  if format `elem` f
    then setUserData $ delete format f
    else setUserData $ format : f
  skip i l
}

