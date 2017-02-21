module Article.View exposing (..)

import Date exposing (Date, year, month, day)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Article.Model exposing (..)
import Article.Message exposing(Msg(..))

view : Article -> Html Msg
view one =
  article []
    [ articleMeta one
    , articleTags one.tags
    , articleContent one
    ]

articleMeta : Article -> Html Msg
articleMeta article =
  let
    posted =
      (dateString article.posted) ++ " posted "
    updated =
      "(" ++ (dateString article.updated) ++ " updated)"
  in
    div [ class "article-meta" ]
      [ span [ class "article-posted" ] [ text posted ]
      , span [ class "article-updated" ] [ text updated ]
      ]

dateString : Date -> String
dateString date =
  (year date |> toString ) ++ " " ++ (month date |> toString) ++ " " ++ (day date |> toString)

articleTitle : Article -> Html Msg
articleTitle article =
  span [ class "article-title" ]
    [ a [ href ("#" ++ article.id)] [text article.content]
    ]

articleTags : List Tag -> Html Msg
articleTags tags =
  ul [ class "article-tags" ] (List.map articleTag tags)

articleTag : Tag -> Html Msg
articleTag tag =
  li [] [ text tag.name ]

articleContent : Article -> Html Msg
articleContent one =
  Markdown.toHtml [ class "article-content"] one.content

