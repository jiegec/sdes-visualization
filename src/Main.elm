module Main exposing (Bits, Model, Msg(..), init, main, update, view)

import Array
import Boxes
import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Utils


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Bits =
    Array.Array Int



-- MODEL


type alias Model =
    { key : Bits
    }


init : Model
init =
    { key = Array.initialize 10 (always 1)
    }



-- UPDATE


type Msg
    = Toggle Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle index ->
            { model
                | key =
                    Array.set index (1 - Utils.getIndex model.key index) model.key
            }



-- VIEW


view : Model -> Html Msg
view model =
    let
        key_p10 =
            Boxes.p10 model.key

        key_ls1_1 =
            Boxes.ls1 key_p10

        key_ls1_2 =
            Boxes.ls1 (Array.slice 5 10 key_p10)

        key_p8_1 =
            Boxes.p8 (Array.append key_ls1_1 key_ls1_2)

        key_ls2_1 =
            Boxes.ls2 key_ls1_1

        key_ls2_2 =
            Boxes.ls2 key_ls1_2

        key_p8_2 =
            Boxes.p8 (Array.append key_ls2_1 key_ls2_2)
    in
    div []
        (List.concat
            [ [ div [] [ text "key" ] ]
            , List.map (\i -> button [ onClick (Toggle i) ] [ text (String.fromInt (Utils.getIndex model.key i)) ]) (List.range 0 (Array.length model.key - 1))
            , [ div [] [ text "p10" ]
              ]
            , viewArray key_p10
            , [ div [] [ text "ls1_1" ]
              ]
            , viewArray key_ls1_1
            , [ div [] [ text "ls1_2" ]
              ]
            , viewArray key_ls1_2
            , [ div [] [ text "p8_1" ]
              ]
            , viewArray key_p8_1
            , [ div [] [ text "p8_2" ]
              ]
            , viewArray key_p8_2
            ]
        )


viewArray : Array.Array Int -> List (Html Msg)
viewArray arr =
    List.map (\i -> button [] [ text (String.fromInt (Utils.getIndex arr i)) ]) (List.range 0 (Array.length arr - 1))
