module View exposing(view)

import Html exposing (..)
import Html.Attributes exposing (..)
import List.Extra
import Material.Spinner as Loading
import Model exposing (Model)
import Message exposing (Msg(..))
import Routing exposing (Route(..))
import Article.List
import Article.View

view : Model -> Html Msg
view model =
  div []
    [ header []
      [ h1 [] [ a [ href "" ] [text "Nyarticles" ] ]
      , input [ type_ "search", placeholder "Search" ] []
      ]
    , hr [] []
    , spinner model.loading
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
        maybeArticle =
          List.Extra.find (\article -> article.id == articleId) model.articles
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

spinner : Bool -> Html Msg
spinner loading =
  case loading of
    True ->
      Loading.spinner [ Loading.active True ]

    False ->
      div [] []

