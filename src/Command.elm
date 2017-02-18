module Command exposing (..)

import Message exposing (Msg(..))
import Routing exposing (Route(..))
import Article.Command exposing (fetchPage)

commandFromRoute : Route -> Cmd Msg
commandFromRoute route =
  case Debug.log "commandFromRoute" route of
    PageRoute pageNum ->
      Cmd.map ArticlesMsg (fetchPage pageNum)

    ArticleRoute articleId ->
      Cmd.none {-- TODO fetch article gist --}

    NotFoundRoute ->
      Cmd.none

