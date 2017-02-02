module Articles.Message exposing (..)

import Http
import Articles.Model exposing (Article)

type Msg
  = LoadPage (Result Http.Error (List Article))

