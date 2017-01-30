module View exposing(view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Message exposing(Msg(..))
import Articles.View

view : Model -> Html Msg
view model =
  div []
    [ header []
      [ h1 [] [ text "Nyarticles" ]
      , input [ type_ "search", placeholder "Search" ] []
      ]
    , hr [] []
    , main_ [] [ Articles.View.view model.articles |> Html.map ArticlesMsg ]
    , hr [] []
    , footer []
      [ span [ class "copyright" ] [ text "© 2017 k5n" ]
      , span [ class "poweredby" ] [ text "Powered by Nyarticles" ]
      ]
    ]

