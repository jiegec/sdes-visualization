module Boxes exposing (..)

import Array
import Bitwise
import Types exposing (..)
import Utils


p10 : Bits -> Bits
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


p8 : Bits -> Bits
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


ls1 : Bits -> Bits
ls1 arr =
    Array.fromList
        [ Utils.getIndex arr 1
        , Utils.getIndex arr 2
        , Utils.getIndex arr 3
        , Utils.getIndex arr 4
        , Utils.getIndex arr 0
        ]


ls2 : Bits -> Bits
ls2 arr =
    Array.fromList
        [ Utils.getIndex arr 2
        , Utils.getIndex arr 3
        , Utils.getIndex arr 4
        , Utils.getIndex arr 0
        , Utils.getIndex arr 1
        ]


ip : Bits -> Bits
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


ep : Bits -> Bits
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


xor : Bits -> Bits -> Bits
xor arr1 arr2 =
    Array.fromList
        [ Utils.xorBit (Utils.getIndex arr1 0) (Utils.getIndex arr2 0)
        , Utils.xorBit (Utils.getIndex arr1 1) (Utils.getIndex arr2 1)
        , Utils.xorBit (Utils.getIndex arr1 2) (Utils.getIndex arr2 2)
        , Utils.xorBit (Utils.getIndex arr1 3) (Utils.getIndex arr2 3)
        , Utils.xorBit (Utils.getIndex arr1 4) (Utils.getIndex arr2 4)
        , Utils.xorBit (Utils.getIndex arr1 5) (Utils.getIndex arr2 5)
        , Utils.xorBit (Utils.getIndex arr1 6) (Utils.getIndex arr2 6)
        , Utils.xorBit (Utils.getIndex arr1 7) (Utils.getIndex arr2 7)
        ]


s0 : Bits -> Bits
s0 arr =
    Array.map (\bit -> Calculated bit (List.concat (Array.toList (Array.map Utils.getDepend arr))))
        (Maybe.withDefault (Array.fromList [ 0, 0 ])
            (Array.get (Utils.getIndexValue arr 0 * 8 + Utils.getIndexValue arr 3 * 4 + Utils.getIndexValue arr 1 * 2 + Utils.getIndexValue arr 2)
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
        )


s1 : Bits -> Bits
s1 arr =
    Array.map (\bit -> Calculated bit (List.concat (Array.toList (Array.map Utils.getDepend arr))))
        (Maybe.withDefault (Array.fromList [ 0, 0 ])
            (Array.get (Utils.getIndexValue arr 0 * 8 + Utils.getIndexValue arr 3 * 4 + Utils.getIndexValue arr 1 * 2 + Utils.getIndexValue arr 2)
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
        )


p4 : Bits -> Bits
p4 arr =
    Array.fromList
        [ Utils.getIndex arr 1
        , Utils.getIndex arr 3
        , Utils.getIndex arr 2
        , Utils.getIndex arr 0
        ]


ip1 : Bits -> Bits
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
