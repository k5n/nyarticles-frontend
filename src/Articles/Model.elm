module Articles.Model exposing (..)

type alias Article =
  { id: String
  , meta: ArticleMeta
  , title: String
  , tags: List Tag
  }

type alias ArticleMeta =
  { posted: String
  , updated: String
  }

type alias Tag =
  { id: String
  , name: String
  }
