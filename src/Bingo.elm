module Bingo (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

title message times =
  let go = 100 in
    message
      ++ " "
      |> toUpper
      |> repeat times
      |> trimRight
      |> text

pageHeader = h1 [] [ title "bingo!" 3 ]

pageFooter =
  footer
    []
    [ a [ href "https://google.com" ]
        [ text "Jannine Weigel" ] ]

entryItem entry =
    li [ ]
        [ span [class "shrase"] [text entry.phrase],
          span [class "shrase"] [text (toString entry.points)]]

newEntry phrase points id =
    { phrase = phrase, points = points, spoken = False, id = id }

entryList =
    ul []
        [ newEntry "Future-Proof" 100 1 |> entryItem,
          newEntry "Future-Proof" 200 2 |> entryItem ]

entry = { pharse = "Future-Proof", points = 100, wasSpoken = False, id = 1 }
cloneEntry = { entry | points = 500, wasSpoken = True }

view =
  div [ id "container" ]
    [ pageHeader, entryList, pageFooter ]

main =
  view





