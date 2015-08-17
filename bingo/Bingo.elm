module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import String

title message times =
  message ++ " "
    |> String.toUpper
    |> String.repeat 3
    |> String.trimRight
    |> Html.text


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


entryItem phrase points =
  li
    [ ]
    [
        span [ class "phrase" ] [ text phrase ],
        span [ class "points" ] [ text (toString points) ]
    ]


entryList =
  ul
    [ ]
    [
        entryItem "Future-Proof" 100,
        entryItem "Doing Agile" 200,
    ]


view =
  div
    [ id "container" ]
    [ pageHeader, entryList, pageFooter ]


main =
  view

