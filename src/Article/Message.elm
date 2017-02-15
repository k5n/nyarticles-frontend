module Article.Message exposing (..)

import Http
import Article.Model exposing (Article)

type Msg
  = LoadPage (Result Http.Error (List Article))

