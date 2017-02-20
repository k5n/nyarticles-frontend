module Article.Command exposing (..)

import Http
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
    (field "posted" string)
    (field "updated" string)
    (field "tags" (list tagDecoder))
    (field "title" string)

tagDecoder : Decoder Tag
tagDecoder =
  map2 Tag
    (field "id" string)
    (field "name" string)

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
    (field "created_at" string)
    (field "updated_at" string)
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

