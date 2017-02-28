module Article.View exposing (..)

import Date exposing (Date, year, month, day)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Article.Model exposing (..)
import Article.Message exposing(Msg(..))

view : Article -> Html Msg
view one =
  let
    firstLine =
      one.content
        |> String.lines
        |> List.head
        |> Maybe.withDefault ""
    title =
      case String.startsWith "# " firstLine of
        True ->
          String.dropLeft 2 firstLine
        False ->
          firstLine
    firstLineLen =
      String.length firstLine
    content =
      String.dropLeft firstLineLen one.content
  in
    article []
      [ articleTitle title
      , articleMeta one
      , articleTags one.tags
      , articleContent content
      ]

articleTitle : String -> Html Msg
articleTitle title =
  h1 [ class "article-title" ] [ text title ]

articleMeta : Article -> Html Msg
articleMeta article =
  let
    posted =
      dateString article.posted
    updated =
      dateString article.updated
  in
    div [ class "article-meta" ]
      [ i [ class "material-icons" ] [ text "publish" ]
      , span [ class "article-posted" ] [ text posted ]
      , i [ class "material-icons" ] [ text "update" ]
      , span [ class "article-updated" ] [ text updated ]
      ]

dateString : Date -> String
dateString date =
  (year date |> toString ) ++ " " ++ (month date |> toString) ++ " " ++ (day date |> toString)

articleTags : List Tag -> Html Msg
articleTags tags =
  ul [ class "article-tags" ] (List.map articleTag tags)

articleTag : Tag -> Html Msg
articleTag tag =
  li [] [ text tag.name ]

articleContent : String -> Html Msg
articleContent content =
    Markdown.toHtml [ class "article-content"] content

