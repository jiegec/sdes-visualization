module Main exposing (Bits, Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Bits =
    List Int


zip : List a -> List b -> List ( a, b )
zip xs ys =
    List.map2 Tuple.pair xs ys



-- MODEL


type alias Model =
    { key : Bits
    }


init : Model
init =
    { key = List.repeat 10 0
    }



-- UPDATE


type Msg
    = Toggle Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle a ->
            { model
                | key =
                    List.map
                        (\( i, data ) ->
                            if i == a then
                                1 - data

                            else
                                data
                        )
                        (zip (List.range 0 10) model.key)
            }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        (List.concat
            [ List.map (\( i, bit ) -> button [ onClick (Toggle i) ] [ text (String.fromInt bit) ]) (zip (List.range 0 10) model.key)
            , [ div [] [ text "test" ]
              ]
            ]
        )
