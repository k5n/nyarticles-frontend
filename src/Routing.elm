module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Article.Model exposing (ArticleId)

type Route
  = PageRoute Int
  | ArticleRoute ArticleId
  | NotFoundRoute

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ map (PageRoute 0) top
    , map PageRoute (s "page" </> int)
    , map ArticleRoute string
    ]

parseLocation : Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route ->
      route

    Nothing ->
      NotFoundRoute

