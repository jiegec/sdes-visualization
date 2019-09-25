module Boxes exposing (..)

import Array
import Utils


p10 : Array.Array Int -> Array.Array Int
p10 arr =
    Array.fromList
        [ Utils.getIndex arr 2
        , Utils.getIndex arr 4
        , Utils.getIndex arr 1
        , Utils.getIndex arr 6
        , Utils.getIndex arr 3
        , Utils.getIndex arr 9
        , Utils.getIndex arr 0
        , Utils.getIndex arr 8
        , Utils.getIndex arr 7
        , Utils.getIndex arr 5
        ]


p8 : Array.Array Int -> Array.Array Int
p8 arr =
    Array.fromList
        [ Utils.getIndex arr 5
        , Utils.getIndex arr 2
        , Utils.getIndex arr 6
        , Utils.getIndex arr 3
        , Utils.getIndex arr 7
        , Utils.getIndex arr 4
        , Utils.getIndex arr 9
        , Utils.getIndex arr 8
        ]


ls1 : Array.Array Int -> Array.Array Int
ls1 arr =
    Array.fromList
        [ Utils.getIndex arr 1
        , Utils.getIndex arr 2
        , Utils.getIndex arr 3
        , Utils.getIndex arr 4
        , Utils.getIndex arr 0
        ]


ls2 : Array.Array Int -> Array.Array Int
ls2 arr =
    Array.fromList
        [ Utils.getIndex arr 2
        , Utils.getIndex arr 3
        , Utils.getIndex arr 4
        , Utils.getIndex arr 0
        , Utils.getIndex arr 1
        ]
