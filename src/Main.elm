module Main exposing (Model, Msg(..), init, main, update, view)

import Array
import Boxes
import Browser
import Css exposing (..)
import Css.Transitions exposing (easeIn, transition)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Types exposing (..)
import Utils


main =
    Browser.sandbox { init = init, update = update, view = view >> toUnstyled }



-- MODEL


type alias Model =
    { key : Bits
    , input : Bits
    }


init : Model
init =
    { key = Array.fromList [ Input 0 "key9", Input 1 "key8", Input 1 "key7", Input 1 "key6", Input 1 "key5", Input 1 "key4", Input 1 "key1", Input 1 "key0", Input 0 "key1", Input 1 "key0" ]
    , input = Array.fromList [ Input 1 "input7", Input 0 "input6", Input 1 "input5", Input 0 "input4", Input 0 "input3", Input 0 "input2", Input 1 "input1", Input 0 "input0" ]
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
                    Array.set index (Utils.invertInput (Utils.getRawIndex model.key index)) model.key
            }

        ToggleInput index ->
            { model
                | input =
                    Array.set index (Utils.invertInput (Utils.getRawIndex model.input index)) model.input
            }



-- VIEW


view : Model -> Html Msg
view model =
    let
        key_p10 =
            Boxes.p10 model.key

        key_ls1_1 =
            Boxes.ls1 (Array.slice 0 5 key_p10)

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
            Boxes.s1 (Array.slice 4 8 input_xor_3)

        input_p4_2 =
            Boxes.p4 (Array.append input_s0_2 input_s1_2)

        input_xor_4 =
            Array.slice 0 4 (Boxes.xor input_r4_2 input_p4_2)

        input_ip1 =
            Boxes.ip1 (Array.append input_xor_4 input_l4_2)
    in
    div [ css [ position relative ] ]
        (List.concat
            [ viewKey 0 0 model
            , viewInput 600 0 model
            , viewP10 0 50 model.key key_p10
            , viewLS1 0 160 (Array.slice 0 5 key_p10) key_ls1_1
            , viewLS1 200 160 (Array.slice 5 10 key_p10) key_ls1_2
            , viewP8 0 280 (Array.append key_ls1_1 key_ls1_2) key_p8_1
            , viewLS2 0 400 key_ls1_1 key_ls2_1
            , viewLS2 200 400 key_ls1_2 key_ls2_2
            , viewP8 0 530 (Array.append key_ls2_1 key_ls2_2) key_p8_2
            , viewIP 600 60 model.input input_ip
            , viewEP 700 180 input_r4_1 input_ep
            , viewXor 700 290 input_ep key_p8_1 input_xor_1
            , viewS0 700 660 (Array.slice 0 4 input_xor_1) input_s0_1
            , viewS1 880 660 (Array.slice 4 8 input_xor_1) input_s1_1
            , viewP4 780 780 (Array.append input_s0_1 input_s1_1) input_p4_1
            , viewXor 750 910 input_p4_1 input_l4_1 input_xor_2
            , viewEP 700 1150 input_l4_2 input_ep_2
            , viewXor 700 1260 input_ep_2 key_p8_2 input_xor_3
            , viewS0 700 1630 (Array.slice 0 4 input_xor_3) input_s0_2
            , viewS1 880 1630 (Array.slice 4 8 input_xor_3) input_s1_2
            , viewP4 800 1750 (Array.append input_s0_2 input_s1_2) input_p4_2
            , viewXor 750 1900 input_p4_2 input_r4_2 input_xor_4
            , viewIP1 750 2150 (Array.append input_xor_4 input_l4_2) input_ip1
            , viewCipherText 500 2300 input_ip1
            ]
        )


bitSize =
    30


bitStyle =
    [ width (px bitSize), height (px bitSize) ]


viewArray : Bits -> Html Msg
viewArray arr =
    styled div
        [ height (px bitSize) ]
        []
        (List.map
            (\i -> viewBit (Utils.getIndex arr i))
            (List.range 0 (Array.length arr - 1))
        )


viewArrayVert : Bits -> Html Msg
viewArrayVert arr =
    styled div
        [ width (px bitSize) ]
        []
        (List.map
            (\i -> viewBitVert (Utils.getIndex arr i))
            (List.range 0 (Array.length arr - 1))
        )


viewBit : Bit -> Html Msg
viewBit bit =
    let
        value =
            Utils.bitValue bit

        depend =
            Utils.getDepend bit
    in
    div
        [ css ([ display inlineBlock, position relative, marginLeft (px 3), marginRight (px 3) ] ++ bitStyle) ]
        [ buttonWithOpacity (int (1 - value)) [] [ text "0" ]
        , buttonWithOpacity (int value) [] [ text "1" ]
        ]


viewBitVert : Bit -> Html Msg
viewBitVert bit =
    let
        value =
            Utils.bitValue bit
    in
    div
        [ css ([ display block, position relative, marginTop (px 3), marginBottom (px 3) ] ++ bitStyle) ]
        [ buttonWithOpacity (int (1 - value)) [] [ text "0" ]
        , buttonWithOpacity (int value) [] [ text "1" ]
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


border =
    [ borderWidth (px 1), borderStyle solid, padding (px 5) ]


viewKey x y model =
    [ div [ css ([ position absolute, left (px x), top (px y) ] ++ border) ]
        (List.concat
            [ [ text "key" ]
            , List.map (\i -> button [ onClick (ToggleKey i), css [ marginLeft (px 3), width (px bitSize), height (px bitSize) ] ] [ text (String.fromInt (Utils.getIndexValue model.key i)) ]) (List.range 0 (Array.length model.key - 1))
            ]
        )
    ]


viewInput x y model =
    [ div [ css ([ position absolute, left (px x), top (px y) ] ++ border) ]
        (List.concat
            [ [ text "input" ]
            , List.map (\i -> button [ onClick (ToggleInput i), css [ marginLeft (px 3), width (px bitSize), height (px bitSize) ] ] [ text (String.fromInt (Utils.getIndexValue model.input i)) ]) (List.range 0 (Array.length model.input - 1))
            ]
        )
    ]


viewCipherText x y bits =
    [ div [ css ([ position absolute, left (px x), top (px y) ] ++ border) ]
        (List.concat
            [ [ text "cipher text" ]
            , [ viewArray bits ]
            ]
        )
    ]


viewP10 x y =
    viewBox x y "P10"


viewP8 x y =
    viewBox x y "P8"


viewLS1 x y =
    viewBox x y "LS-1"


viewLS2 x y =
    viewBox x y "LS-2"


viewIP x y =
    viewBox x y "IP"


viewIP1 x y =
    viewBox x y "IP-1"


viewEP x y =
    viewBox x y "EP"


viewS0 x y =
    viewBox x y "S0"


viewS1 x y =
    viewBox x y "S1"


viewP4 x y =
    viewBox x y "P4"


viewBox x y name input output =
    [ div [ css ([ position absolute, left (px x), top (px y), textAlign center ] ++ border) ]
        (List.concat
            [ [ viewArray input ]
            , [ div [ css [ padding (px 5) ] ] [ text name ] ]
            , [ viewArray output ]
            ]
        )
    ]


viewXor x y input1 input2 output =
    [ div [ css ([ position absolute, left (px x), top (px y), textAlign center ] ++ border) ]
        (List.concat
            [ [ div [ css [ paddingLeft (px bitSize) ] ] [ viewArray input1 ] ]
            , [ div [ css [ position absolute, displayFlex, alignItems center, justifyContent center, top (px 0), paddingLeft (px (bitSize / 2)), width (pct 100), height (pct 100), fontSize (px 100) ] ] [ text "⊕" ] ]
            , [ viewArrayVert input2 ]
            , [ div [ css [ paddingLeft (px bitSize) ] ] [ viewArray output ] ]
            ]
        )
    ]
