module Main exposing (Bits, Model, Msg(..), init, main, update, view)

import Array
import Boxes
import Browser
import Css exposing (..)
import Css.Transitions exposing (easeIn, transition)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Utils


main =
    Browser.sandbox { init = init, update = update, view = view >> toUnstyled }


type alias Bits =
    Array.Array Int



-- MODEL


type alias Model =
    { key : Bits
    , input : Bits
    }


init : Model
init =
    { key = Array.fromList [ 0, 1, 1, 1, 1, 1, 1, 1, 0, 1 ]
    , input = Array.fromList [ 1, 0, 1, 0, 0, 0, 1, 0 ]
    }



-- UPDATE


type Msg
    = ToggleKey Int
    | ToggleInput Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleKey index ->
            { model
                | key =
                    Array.set index (1 - Utils.getIndex model.key index) model.key
            }

        ToggleInput index ->
            { model
                | input =
                    Array.set index (1 - Utils.getIndex model.input index) model.input
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

        input_ip =
            Boxes.ip model.input

        input_l4_1 =
            Array.slice 0 4 input_ip

        input_r4_1 =
            Array.slice 4 8 input_ip

        input_ep =
            Boxes.ep input_r4_1

        input_xor_1 =
            Boxes.xor key_p8_1 input_ep

        input_s0_1 =
            Boxes.s0 (Array.slice 0 4 input_xor_1)

        input_s1_1 =
            Boxes.s1 (Array.slice 4 8 input_xor_1)

        input_p4_1 =
            Boxes.p4 (Array.append input_s0_1 input_s1_1)

        input_xor_2 =
            Array.slice 0 4 (Boxes.xor input_l4_1 input_p4_1)

        input_l4_2 =
            Array.slice 0 4 input_xor_2

        input_r4_2 =
            input_r4_1

        input_ep_2 =
            Boxes.ep input_l4_2

        input_xor_3 =
            Boxes.xor key_p8_2 input_ep_2

        input_s0_2 =
            Boxes.s0 (Array.slice 0 4 input_xor_3)

        input_s1_2 =
            Boxes.s0 (Array.slice 4 8 input_xor_3)

        input_p4_2 =
            Boxes.p4 (Array.append input_s0_2 input_s1_2)

        input_xor_4 =
            Array.slice 0 4 (Boxes.xor input_r4_2 input_p4_2)

        input_ip1 =
            Boxes.ip1 (Array.append input_xor_4 input_l4_2)
    in
    div [ css [ position relative ] ]
        (List.concat
            [ viewKey model
            , viewInput model
            , viewCipherText input_ip1
            ]
        )


bitSize =
    30


viewArray : Array.Array Int -> Html Msg
viewArray arr =
    styled div
        [ height (px bitSize) ]
        []
        (List.map
            (\i -> viewBit (Utils.getIndex arr i))
            (List.range 0 (Array.length arr - 1))
        )


viewBit : Int -> Html Msg
viewBit bit =
    div
        [ css [ width (px bitSize), height (px bitSize), display inlineBlock, position relative, paddingLeft (px 3) ] ]
        [ buttonWithOpacity (int (1 - bit)) [] [ text "0" ]
        , buttonWithOpacity (int bit) [] [ text "1" ]
        ]


buttonWithOpacity o =
    styled div
        [ opacity o
        , position absolute
        , display inline
        , left (px 0)
        , width (px bitSize)
        , height (px bitSize)
        , lineHeight (px bitSize)
        , borderWidth (px 1)
        , borderStyle solid
        , textAlign center
        , transition [ Css.Transitions.opacity 1500 ]
        ]

border= [borderWidth (px 1), borderStyle solid, padding (px 5)]

viewKey model =
    [ div [ css ([ position absolute, left (px 0), top (px 0)] ++ border) ]
        (List.concat
            [ [ text "key" ]
            , List.map (\i -> button [ onClick (ToggleKey i), css [ marginLeft (px 3) ] ] [ text (String.fromInt (Utils.getIndex model.key i)) ]) (List.range 0 (Array.length model.key - 1))
            ]
        )
    ]


viewInput model =
    [ div [ css ([ position absolute, left (px 400), top (px 0)] ++ border) ]
        (List.concat
            [ [ text "input" ]
            , List.map (\i -> button [ onClick (ToggleInput i), css [ marginLeft (px 3) ] ] [ text (String.fromInt (Utils.getIndex model.input i)) ]) (List.range 0 (Array.length model.input - 1))
            ]
        )
    ]

viewCipherText cipher =
    [ div [ css ([ position absolute, left (px 200), top (px 200)] ++ border) ]
        (List.concat
            [ [ text "cipher text" ]
            , [ viewArray cipher ]
            ]
        )
    ]
