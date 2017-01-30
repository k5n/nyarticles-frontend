module Update exposing (update)

import Model exposing (Model)
import Message exposing(Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ArticlesMsg _ ->
      ( model, Cmd.none )

