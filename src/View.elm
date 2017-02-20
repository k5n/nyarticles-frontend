module View exposing(view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Message exposing (Msg(..))
import Routing exposing (Route(..))
import Article.List
import Article.View

view : Model -> Html Msg
view model =
  div []
    [ header []
      [ h1 [] [ text "Nyarticles" ]
      , input [ type_ "search", placeholder "Search" ] []
      ]
    , hr [] []
    , main_ [] [ mainContent model ]
    , hr [] []
    , footer []
      [ span [ class "copyright" ] [ text "© 2017 k5n" ]
      , span [ class "poweredby" ] [ text "Powered by Nyarticles" ]
      ]
    ]

mainContent : Model -> Html Msg
mainContent model =
  case model.route of
    PageRoute pageNum ->
      Article.List.view model.articles |> Html.map ArticleMsg

    ArticleRoute articleId ->
      let
        maybeArticle = List.head model.articles
      in
        case maybeArticle of
          Just article ->
            Article.View.view article |> Html.map ArticleMsg

          Nothing ->
            notFoundView

    NotFoundRoute ->
      notFoundView

notFoundView : Html Msg
notFoundView =
  div [] [ text "Not Found" ]

