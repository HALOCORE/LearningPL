doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x > 100
    then x
    else x * 2

doubleSmallNumber' :: (Num a, Ord a) => a -> a
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

length' :: Num a => [t] -> a
length' xs = sum [1 | _ <- xs]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

xxs :: [[Integer]]
xxs = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

filteredxss :: [[Integer]]
filteredxss = [[x | x <- xs, odd x] | xs <- xxs]

rightTriangles :: [(Integer, Integer, Integer)]
rightTriangles = [(a,b,c) | a <- [1..10], b <- [1..a], c <- [1..b], c*c+b*b==a*a, a+b+c==24]

lucky :: (Integral a, Show a) => a -> [Char]
lucky 7 = "good!"
lucky x = "sorry! not good." ++ (show x)

addVectors :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a, Num b) => (a, a) -> (b, b) -> (a, b)
addVectors' (x1, y1) (x2, y2) = (x1 + y1, x2 + y2)

xs1 :: [(Integer, Integer)]
xs1 = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]

xssumed :: [Integer]
xssumed = [a + b | (a,b) <- xs1]


bmiTell :: (RealFloat a) => a -> a -> [Char]
bmiTell weight height 
    | bmi < skinny = "too thin" 
    | bmi < normal = "normal" 
    | otherwise = "whale" 
    where bmi = weight / height ^ 2
          (skinny, normal) = (18.5, 25.0)


calcBmis :: Fractional a => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w,h) <- xs]
    where bmi w h = w / h ^ 2

head' xs = case xs of [] -> error "empty!"
                      (x:_) -> x

describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [_] = "a singleton list."  
          what _ = "a longer list." 

take' n _ 
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

quicksort [] = []
quicksort (x:xs) = 
    let leftpart = quicksort [y | y<-xs, y <= x]
        rightpart = quicksort [y | y<-xs, y > x]     
    in leftpart ++ [x] ++ rightpart

dividebyten :: Double -> Double
dividebyten = (/10)

multbyten :: Double -> Double
multbyten = (*10.0)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

subtractten :: Integer -> Integer
subtractten = subtract 10

applyTwice :: (t -> t) -> t -> t
applyTwice f x = f (f x)

myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

myFlip :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
myFlip f x y = f y x

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs)
    | f x = x : myFilter f xs
    | otherwise = myFilter f xs

collatz :: Integral a => a -> [a]
collatz 1 = [1]
collatz x
    | even x = x : collatz (x `div` 2)
    | otherwise = x : collatz (x * 3 + 1)

under100collatzgt15 :: Int
under100collatzgt15 = length (filter (>15) (take 100 (map (length . collatz) [1..])))

