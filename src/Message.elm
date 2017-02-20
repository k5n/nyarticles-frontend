module Message exposing (Msg(..))

import Navigation exposing (Location)
import Article.Message

type Msg
  = ArticleMsg Article.Message.Msg
  | OnLocationChange Location

