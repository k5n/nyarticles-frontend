module Update exposing (update)

import Model exposing (Model)
import Message exposing(Msg(..))
import Articles.Update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ArticlesMsg subMsg ->
      let
        (newArticles, cmd) =
          Articles.Update.update subMsg model.articles
      in
        ( { model | articles = newArticles }, Cmd.map ArticlesMsg cmd)

