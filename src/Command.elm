module Command exposing (..)

import Message exposing (Msg(..))
import Routing exposing (Route(..))
import Article.Command exposing (fetchPage, fetchArticle)

commandFromRoute : Route -> Cmd Msg
commandFromRoute route =
  case Debug.log "commandFromRoute" route of
    PageRoute pageNum ->
      Cmd.map ArticleMsg (fetchPage pageNum)

    ArticleRoute articleId ->
      Cmd.map ArticleMsg (fetchArticle articleId)

    NotFoundRoute ->
      Cmd.none

