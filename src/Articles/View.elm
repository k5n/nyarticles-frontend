module Articles.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Articles.Model exposing (..)
import Articles.Message exposing(Msg(..))

view : List Article -> Html Msg
view articles =
  div []
    [ div [] (List.map oneArticle articles)
    ]

oneArticle : Article -> Html Msg
oneArticle one =
  article []
    [ articleMeta one.meta
    , articleTitle one.title
    , articleTags one.tags
    ]

articleMeta : ArticleMeta -> Html Msg
articleMeta meta =
  let
    updated =
      if String.length meta.updated == 0 then
        ""
      else
        "(" ++ meta.updated ++ " updated)"
  in
    div [ class "article-meta" ]
      [ span [ class "article-posted" ] [ text (meta.posted ++ " posted ") ]
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

