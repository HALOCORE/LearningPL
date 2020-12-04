import Data.Char
import qualified Data.Map as Map

import Geometry.Cube ( area )
arr :: Float
arr = area 100


isHelloOK :: Bool
isHelloOK = all isAlphaNum "hello"

assmap :: Map.Map Integer Integer
assmap = Map.fromList [(1,10),(2,20),(1,40),(3,30)]


v1 :: Bool
v1 = foldr (&&) True (False:(repeat True))
-- False && (foldr (&&) True (tail False:(repeat True)))
v2 :: Bool
v2 = foldl (&&) True (False:(repeat True))
-- https://stackoverflow.com/questions/3429634/foldl-is-tail-recursive-so-how-come-foldr-runs-faster-than-foldl#:~:text=In%20most%20cases%20foldr%20is,and%20how%20lazy%20it%20is.