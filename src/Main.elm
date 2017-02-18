module Main exposing (..)

import Navigation exposing (Location)
import Html exposing (program)
import View exposing (view)
import Model exposing (Model, initialModel)
import Message exposing (Msg(..))
import Update exposing (update)
import Routing exposing (parseLocation)
import Command exposing (commandFromRoute)
import Article.Command exposing (fetchArticleList)

init : Location -> (Model, Cmd Msg)
init location =
  ( initialModel (Routing.parseLocation location)
  , parseLocation location |> commandFromRoute
  )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main : Program Never Model Msg
main =
  Navigation.program OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

