module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

title message times =
  message ++ " "
    |> toUpper
    |> repeat 3
    |> trimRight
    |> text


newEntry phrase points id =
  { phrase = phrase,
    points = points,
    wasSpoken = False,
    id = id
  }


pageHeader =
  h1 [ ] [ title "Bingo!" 3 ]


pageFooter =
  footer
    [ ]
    [
      a
        [ href "https://pragmaticstudio.com"  ]
        [ text "The Pragmatic Studio" ]
    ]


entryItem entry =
  li
    [ ]
    [
      span [ class "phrase" ] [ text entry.phrase ],
      span [ class "points" ] [ text (toString entry.points) ]
    ]


entryList =
  ul
    [ ]
    [
      entryItem (newEntry "Future-Proof" 100 1),
      entryItem (newEntry "Doing Agile" 200 2)
    ]


view =
  div
    [ id "container" ]
    [ pageHeader, entryList, pageFooter ]


main =
  view

