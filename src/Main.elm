module Main exposing (..)

import Html exposing (program)
import View exposing (view)
import Model exposing (Model, initialModel)
import Message exposing (Msg(..))
import Update exposing (update)
import Articles.Command exposing (fetchArticleList)

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.map ArticlesMsg fetchArticleList)

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
