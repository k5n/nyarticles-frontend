module Model exposing(..)

import Article.Model exposing (..)

type alias Model =
  { articles: List Article
  }

initialModel : Model
initialModel =
  { articles = []
  }

{-
  { articles =
    [ { id = "00000001"
      , meta = { posted = "2017-01-10", updated = "2017-01-17" }
      , title = "Nyarticleの画面作成用ダミー記事"
      , tags =
        [ { id = "0", name = "HTML5" }
        , { id = "1", name = "CSS3" }
        ]
      }
    ]
  }
-}
