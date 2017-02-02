module Articles.Model exposing (..)

type alias Article =
  { url: String
  , posted: String
  , updated: String
  , title: String
  , tags: List Tag
  }

type alias Tag =
  { id: String
  , name: String
  }
