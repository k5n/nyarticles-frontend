module Article.Command exposing (..)

import Http
import Date exposing (Date)
import Json.Decode as Decode exposing (..)
import Article.Model exposing (Article, Tag, ArticleId)
import Article.Message exposing (Msg(..))

{-
 Article list
-}

fetchPage : Int -> Cmd Msg
fetchPage pageNum =
  pageUrl pageNum |> fetchArticleList

fetchArticleList : String -> Cmd Msg
fetchArticleList url =
  Http.get url collectionDecoder |> Http.send LoadPage

pageUrl : Int -> String
pageUrl pageNum =
  "http://localhost:8080/page/" ++ (toString pageNum)

collectionDecoder : Decoder (List Article)
collectionDecoder =
  list articleDecoder

articleDecoder : Decoder Article
articleDecoder =
  map5 Article
    (field "id" string)
    (field "posted" string |> andThen stringToDate)
    (field "updated" string |> andThen stringToDate)
    (field "tags" (list tagDecoder))
    (field "title" string)

tagDecoder : Decoder Tag
tagDecoder =
  map2 Tag
    (field "id" string)
    (field "name" string)

stringToDate: String -> Decoder Date
stringToDate str =
  case (Date.fromString str) of
    Ok date ->
      succeed date

    Err error ->
      fail error

{-
 An article
-}

fetchArticle : ArticleId -> Cmd Msg
fetchArticle articleId =
  Http.get (articleUrl articleId) gistJsonDecoder |> Http.send LoadArticle

articleUrl : ArticleId -> String
articleUrl articleId =
  "https://api.github.com/gists/" ++ articleId

gistJsonDecoder : Decoder Article
gistJsonDecoder =
  map5 Article
    (field "id" string)
    (field "created_at" string |> andThen stringToDate)
    (field "updated_at" string |> andThen stringToDate)
    (map stringToTagList (at ["files", "meta.json", "content"] string))
    (at ["files", "article.md", "content"]  string)

stringToTagList : String -> (List Tag)
stringToTagList content =
  case (decodeString decodeMetaJson content) of
    Ok tags ->
      tags

    Err _ ->
      []

decodeMetaJson : Decoder (List Tag)
decodeMetaJson =
  field "tags" (list decodeTag)

decodeTag : Decoder Tag
decodeTag =
  map2 Tag
    (field "id" string)
    (field "name" string)

