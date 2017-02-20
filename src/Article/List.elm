module Article.List exposing (view)

import Html exposing (..)
import Article.Model exposing (..)
import Article.Message exposing (Msg(..))
import Article.View exposing (articleMeta, articleTitle, articleTags)

view : List Article -> Html Msg
view articles =
  div [] (List.map oneArticle articles)

oneArticle : Article -> Html Msg
oneArticle one =
  article []
    [ articleMeta one
    , articleTitle one
    , articleTags one.tags
    ]

