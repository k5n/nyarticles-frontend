module Article.View exposing (..)

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

