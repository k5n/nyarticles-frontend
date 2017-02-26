module Model exposing(..)

import Routing exposing(Route)
import Article.Model exposing (..)

type alias Model =
  { route: Route
  , articles: List Article
  , loading: Bool
  }

initialModel : Route -> Model
initialModel route =
  { route = route
  , articles = []
  , loading = True
  }

