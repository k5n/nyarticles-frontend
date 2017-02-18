module Message exposing (Msg(..))

import Navigation exposing (Location)
import Article.Message

type Msg
  = ArticlesMsg Article.Message.Msg
  | OnLocationChange Location

