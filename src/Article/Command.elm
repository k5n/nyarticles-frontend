module Article.Command exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Article.Model exposing (Article, Tag)
import Article.Message exposing (Msg(..))

{--
 Article List
--}

fetchPage : Int -> Cmd Msg
fetchPage pageNum =
  pageUrl pageNum |> fetchArticleList

fetchArticleList : String -> Cmd Msg
fetchArticleList url =
  Http.get url collectionDecoder |> Http.send LoadPage

pageUrl : Int -> String
pageUrl pageNum =
  "http://localhost:8080/page/" ++ (toString pageNum)

collectionDecoder : Decode.Decoder (List Article)
collectionDecoder =
  Decode.list articleDecoder

articleDecoder : Decode.Decoder Article
articleDecoder =
  Decode.map5 Article
    (field "id" Decode.string)
    (field "posted" Decode.string)
    (field "updated" Decode.string)
    (field "title" Decode.string)
    (field "tags" (Decode.list tagDecoder))

tagDecoder : Decode.Decoder Tag
tagDecoder =
  Decode.map2 Tag
    (field "id" Decode.string)
    (field "name" Decode.string)

