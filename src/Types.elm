module Types exposing (Bit(..), Bits)

import Array


type Bit
    = Input Int String
    | Calculated Int (List Bit)


type alias Bits =
    Array.Array Bit
