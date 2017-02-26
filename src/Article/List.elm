module Article.List exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Article.Model exposing (..)
import Article.Message exposing (Msg(..))
import Article.View exposing (articleMeta, articleTags)

view : List Article -> Html Msg
view articles =
  div [ class "article-list" ] (List.map oneArticle articles)

oneArticle : Article -> Html Msg
oneArticle one =
  article []
    [ articleMeta one
    , articleTitle one
    , articleTags one.tags
    ]

articleTitle : Article -> Html Msg
articleTitle article =
  h1 [ class "article-title" ]
    [ a [ href ("#" ++ article.id)] [text article.content]
    ]

