module Utils exposing (..)

import Array
import Bitwise
import Types exposing (..)


getIndex : Bits -> Int -> Bit
getIndex arr index =
    copyBit (getRawIndex arr index)


getRawIndex : Bits -> Int -> Bit
getRawIndex arr index =
    Maybe.withDefault (Input 0 "None") (Array.get index arr)


getIndexValue : Bits -> Int -> Int
getIndexValue arr index =
    bitValue (getIndex arr index)


copyBit bit =
    case bit of
        Input data id ->
            Calculated data [ Input data id ]

        _ ->
            bit


bitValue bit =
    case bit of
        Input data _ ->
            data

        Calculated data _ ->
            data


getDepend bit =
    case bit of
        Input _ _ ->
            [ bit ]

        Calculated _ depend ->
            depend


xorBit bit1 bit2 =
    Calculated (Bitwise.xor (bitValue bit1) (bitValue bit2)) (List.append (getDepend bit1) (getDepend bit2))


invertInput bit =
    case bit of
        Input data id ->
            Input (1 - data) id

        Calculated _ depend ->
            Input 0 "None"


bitId bit =
    case bit of
        Input data id ->
            id

        Calculated data _ ->
            "None"
