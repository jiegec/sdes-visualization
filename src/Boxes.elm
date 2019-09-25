module Boxes exposing (..)

import Array
import Bitwise
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


ip : Array.Array Int -> Array.Array Int
ip arr =
    Array.fromList
        [ Utils.getIndex arr 1
        , Utils.getIndex arr 5
        , Utils.getIndex arr 2
        , Utils.getIndex arr 0
        , Utils.getIndex arr 3
        , Utils.getIndex arr 7
        , Utils.getIndex arr 4
        , Utils.getIndex arr 6
        ]


ep : Array.Array Int -> Array.Array Int
ep arr =
    Array.fromList
        [ Utils.getIndex arr 3
        , Utils.getIndex arr 0
        , Utils.getIndex arr 1
        , Utils.getIndex arr 2
        , Utils.getIndex arr 1
        , Utils.getIndex arr 2
        , Utils.getIndex arr 3
        , Utils.getIndex arr 0
        ]


xor : Array.Array Int -> Array.Array Int -> Array.Array Int
xor arr1 arr2 =
    Array.fromList
        [ Bitwise.xor (Utils.getIndex arr1 0) (Utils.getIndex arr2 0)
        , Bitwise.xor (Utils.getIndex arr1 1) (Utils.getIndex arr2 1)
        , Bitwise.xor (Utils.getIndex arr1 2) (Utils.getIndex arr2 2)
        , Bitwise.xor (Utils.getIndex arr1 3) (Utils.getIndex arr2 3)
        , Bitwise.xor (Utils.getIndex arr1 4) (Utils.getIndex arr2 4)
        , Bitwise.xor (Utils.getIndex arr1 5) (Utils.getIndex arr2 5)
        , Bitwise.xor (Utils.getIndex arr1 6) (Utils.getIndex arr2 6)
        , Bitwise.xor (Utils.getIndex arr1 7) (Utils.getIndex arr2 7)
        ]


s0 : Array.Array Int -> Array.Array Int
s0 arr =
    Maybe.withDefault (Array.fromList [ 0, 0 ])
        (Array.get (Utils.getIndex arr 0 * 8 + Utils.getIndex arr 3 * 4 + Utils.getIndex arr 1 * 2 + Utils.getIndex arr 2)
            (Array.fromList
                [ Array.fromList [ 1, 0 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 0 ]
                ]
            )
        )


s1 : Array.Array Int -> Array.Array Int
s1 arr =
    Maybe.withDefault (Array.fromList [ 0, 0 ])
        (Array.get (Utils.getIndex arr 0 * 8 + Utils.getIndex arr 3 * 4 + Utils.getIndex arr 1 * 2 + Utils.getIndex arr 2)
            (Array.fromList
                [ Array.fromList [ 0, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 1, 1 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 1, 0 ]
                , Array.fromList [ 0, 1 ]
                , Array.fromList [ 0, 0 ]
                , Array.fromList [ 1, 1 ]
                ]
            )
        )


p4 : Array.Array Int -> Array.Array Int
p4 arr =
    Array.fromList
        [ Utils.getIndex arr 1
        , Utils.getIndex arr 3
        , Utils.getIndex arr 2
        , Utils.getIndex arr 0
        ]


ip1 : Array.Array Int -> Array.Array Int
ip1 arr =
    Array.fromList
        [ Utils.getIndex arr 3
        , Utils.getIndex arr 0
        , Utils.getIndex arr 2
        , Utils.getIndex arr 4
        , Utils.getIndex arr 6
        , Utils.getIndex arr 1
        , Utils.getIndex arr 7
        , Utils.getIndex arr 5
        ]
