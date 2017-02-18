module Article.Model exposing (..)

type alias ArticleId =
  String

type alias Article =
  { id: ArticleId
  , posted: String
  , updated: String
  , title: String
  , tags: List Tag
  }

type alias Tag =
  { id: String
  , name: String
  }
