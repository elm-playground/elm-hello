module Bingo (..) where

import Html
import String

title message times =
  let go = 100 in
  message ++ " "
    |> String.toUpper
    |> String.repeat times
    |> String.reverse
    |> String.trimRight
    |> Html.text

main =
  title "bingo" 3

