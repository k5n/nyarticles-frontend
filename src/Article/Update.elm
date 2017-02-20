module Article.Update exposing (..)

import Article.Message exposing (Msg(..))
import Article.Model exposing (Article)

update : Msg -> List Article -> (List Article, Cmd Msg)
update message articles =
  case message of
    LoadPage (Ok newArticles) ->
      (newArticles, Cmd.none)

    LoadPage (Err error) ->
      ([], Cmd.none)

    LoadArticle (Ok newArticle) ->
      ([ newArticle ], Cmd.none)

    LoadArticle (Err error) ->
      ([], Cmd.none)

