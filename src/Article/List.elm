module Article.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Article.Model exposing (..)
import Article.Message exposing(Msg(..))

view : List Article -> Html Msg
view articles =
  div []
    [ div [] (List.map oneArticle articles)
    ]

oneArticle : Article -> Html Msg
oneArticle one =
  article []
    [ articleMeta one
    , articleTitle one.title
    , articleTags one.tags
    ]

articleMeta : Article -> Html Msg
articleMeta article =
  let
    updated =
      if String.length article.updated == 0 then
        ""
      else
        "(" ++ article.updated ++ " updated)"
  in
    div [ class "article-meta" ]
      [ span [ class "article-posted" ] [ text (article.posted ++ " posted ") ]
      , span [ class "article-updated" ] [ text updated ]
      ]

articleTitle : String -> Html Msg
articleTitle title =
  span [ class "article-title" ] [ text title ]

articleTags : List Tag -> Html Msg
articleTags tags =
  ul [ class "article-tags" ] (List.map articleTag tags)

articleTag : Tag -> Html Msg
articleTag tag =
  li [] [ text tag.name ]

