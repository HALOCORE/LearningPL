
cellA :: (Ord a1, Num a1, Num a2, Eq a2) => a1 -> a1 -> a2
cellA x y = if (x > y) || (-x > y) then 0 
    else if y < 0 then 0
    else if y == 0 && x == 0 then 1 
    else case (cellA (x-1) (y-1), cellA x (y-1), cellA (x+1) (y-1)) of
    (1,1,1) -> 0
    (1,1,0) -> 0
    (1,0,1) -> 0
    (1,0,0) -> 1
    (0,1,1) -> 1
    (0,1,0) -> 1
    (0,0,1) -> 1
    (0,0,0) -> 0



