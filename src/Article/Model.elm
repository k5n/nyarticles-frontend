module Article.Model exposing (..)

type alias ArticleId =
  String

type alias Article =
  { id: ArticleId
  , posted: String
  , updated: String
  , tags: List Tag
  , content: String {- If this is one of an aritlce list, this includes only it's title. -}
  }

type alias Tag =
  { id: String
  , name: String
  }
