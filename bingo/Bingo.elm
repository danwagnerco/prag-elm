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


view =
    div [ id "container" ] [ pageHeader, pageFooter ]


main =
    view

