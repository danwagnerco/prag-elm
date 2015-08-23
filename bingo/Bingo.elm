module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

-- UPDATE

type Action
  = NoOp
  | Sort

update action model =
  case action of
    NoOp ->
      model

    Sort ->
      { model | entries <- List.sortBy .points model.entries }

-- MODEL

newEntry phrase points id =
  {
    phrase = phrase,
    points = points,
    wasSpoken = False,
    id = id
  }

initialModel =
  {
    entries =
      [
        newEntry "Doing Agile" 200 2,
        newEntry "In The Cloud" 300 3,
        newEntry "Future-Proof" 100 1,
        newEntry "Rockstar Ninja" 400 4
      ]
  }

-- VIEW

title message times =
  message ++ " "
    |> toUpper
    |> repeat 3
    |> trimRight
    |> text

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

entryList entries =
  ul
    [ ] (List.map entryItem entries)

view model =
  div
    [ id "container" ]
    [ pageHeader, entryList model.entries, pageFooter ]

-- WIRE IT ALL TOGETHER

main =
  -- view (update Sort initialModel)
  initialModel
    |> update Sort
    |> view

