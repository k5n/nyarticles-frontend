module Update exposing (..)

import Model exposing (Model)
import Message exposing (Msg(..))
import Routing exposing (parseLocation)
import Command exposing (commandFromRoute)
import Article.Update

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case Debug.log "update" msg of
    ArticleMsg subMsg ->
      let
        (newArticles, cmd) =
          Article.Update.update subMsg model.articles
      in
        ( { model | articles = newArticles }, Cmd.map ArticleMsg cmd)

    OnLocationChange location ->
      let
        newRoute =
          parseLocation location
        newCommand =
          commandFromRoute newRoute
      in
        ( { model | route = newRoute }, newCommand )

