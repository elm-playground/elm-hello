module Bingo (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

-- MODEL
entryItem entry =
    li [ ]
        [ span [class "shrase"] [text entry.phrase],
          span [class "points"] [text (toString entry.points)]]


newEntry phrase points id =
    { phrase = phrase, points = points, spoken = False, id = id }

entryList entries =
    ul [] (List.map entryItem entries)

initialModel =
    { entries =
        [ newEntry "Doing Agile" 200 2,
          newEntry "In The Cloud" 300 3,
          newEntry "Future-Proof" 100 4,
          newEntry "Rock-Start Ninja" 400 4 ]}

-- UPDATE
type Action
    = NoOp
    | Sort

update action model =
    case action of
        NoOp ->
            model
        Sort ->
            { model | entries = List.sortBy .points model.entries }

-- VIEW
title message times =
  let go = 100 in
    message
      ++ "  "
      |> toUpper
      |> repeat times
      |> trimRight
      |> text

pageHeader = h1 [] [ title "bingo!" 3 ]

pageFooter =
  footer
    []
    [ a [ href "https://google.com" ]
        [ text "Jannine Weigel" ]]
view model =
  div [ id "container" ]
    [ pageHeader, entryList model.entries , pageFooter ]

-- WIRE IT ALL TOGATHER
main =
  view (update Sort initialModel)



