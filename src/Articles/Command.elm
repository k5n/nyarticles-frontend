module Articles.Command exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Articles.Model exposing (Article, Tag)
import Articles.Message exposing (Msg(..))

fetchArticleList : Cmd Msg
fetchArticleList =
  Http.get fetchArticleListUrl collectionDecoder
    |> Http.send LoadPage

fetchArticleListUrl : String
fetchArticleListUrl =
  "http://localhost:8080/page/0"

collectionDecoder : Decode.Decoder (List Article)
collectionDecoder =
  Decode.list articleDecoder

articleDecoder : Decode.Decoder Article
articleDecoder =
  Decode.map5 Article
    (field "url" Decode.string)
    (field "posted" Decode.string)
    (field "updated" Decode.string)
    (field "title" Decode.string)
    (field "tags" (Decode.list tagDecoder))

tagDecoder : Decode.Decoder Tag
tagDecoder =
  Decode.map2 Tag
    (field "id" Decode.string)
    (field "name" Decode.string)

