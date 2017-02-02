module Articles.Update exposing (..)

import Articles.Message exposing (Msg(..))
import Articles.Model exposing (Article)

update : Msg -> List Article -> (List Article, Cmd Msg)
update message articles =
  case message of
    LoadPage (Ok newArticles) ->
      (newArticles, Cmd.none)

    LoadPage (Err error) ->
      (articles, Cmd.none)

