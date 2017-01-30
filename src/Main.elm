module Main exposing (..)

import Html exposing (program)
import View exposing (view)
import Model exposing (Model, initialModel)
import Message exposing (Msg(..))
import Update exposing (update)

init : ( Model, Cmd Msg )
init =
  ( initialModel, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
