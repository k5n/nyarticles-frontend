module Update exposing (update)

import Model exposing (Model)
import Message exposing (Msg(..))
import Routing exposing (parseLocation)
import Article.Update

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ArticlesMsg subMsg ->
      let
        (newArticles, cmd) =
          Article.Update.update subMsg model.articles
      in
        ( { model | articles = newArticles }, Cmd.map ArticlesMsg cmd)

    OnLocationChange location ->
      let
        newRoute =
          parseLocation location
      in
        ( { model | route = newRoute }, Cmd.none )

