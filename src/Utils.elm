module Utils exposing (getIndex)

import Array


getIndex : Array.Array Int -> Int -> Int
getIndex arr index =
    Maybe.withDefault 0 (Array.get index arr)
