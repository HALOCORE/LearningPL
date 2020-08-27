-- https://www.youtube.com/watch?v=02_H3LjqMr8

-- ghci
--   to enter commandline.
-- :l haskell-tut
--   to load module.
-- :r
--   to reload.

-- Comments
{-
 multiline Comments
-}

import Data.List
import System.IO

-- Int -2^63 2^63
maxInt :: Int
maxInt = maxBound :: Int

-- Float
-- Double
myFloat :: Double
myFloat = 2.0 + 3.5

-- Bool True False
-- Char '
-- Tuple 

-- math + - * /
modEx = mod 5 4
modEx2 = 5 `mod` 4
negNumEx = 5 + (-4)
-- more math 
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

-- also sin, cos, tan, asin, atan, acos, sinh, tanh, cosh, asinh, atanh, acosh
-- use   :t sqrt   to see sqrt's type on ghci command line
-- also   :t (+)
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)
notTrue2 = not True

always5 :: Int
always5 = 5

sumOfNums = sum [1..1000]

times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs


-- prime numbers
primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29]
favNums = 2 : 7 : 21 : 66 : []
multList = [[2,5,7],[11,13,17]]
morePrimes2 = 2 : morePrimes

lenPrime = length morePrimes2
revPrime = reverse morePrimes2
isListEmpty = null morePrimes2
secondPrime = morePrimes2 !! 1
firstPrime = head morePrimes2
lastPrime = last morePrimes2
-- init is drop the last one, the left list.
primeInit = init morePrimes2
first3Primes = take 3 morePrimes2
removePrimes = drop 3 morePrimes2
is7InList = 7 `elem` morePrimes2
  
maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2

newList = [2,3,5]
prodPrimes = product newList

evenList = [2,4..20]
letterList = ['A','C'..'Z']
infinPow10 = [10,20..]
many2s = take 10 (repeat 2)
many3s = replicate 10 3
cycleList = take 10 (cycle [1,2,3,4,5])

listTimes2 = [x * 2 | x <- [1..10]]
listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]
divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

sortedList = sort [9,1,8,3,4,7,6]
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
listBiggerThen5 = filter (>5) morePrimes
evensUpTo20 = takeWhile (<= 20) [2,4..]
multOfList = foldl (*) 1 [2,3,4,5]
pow3List = [3^n | n <- [1..10]]
multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 52)
bobsNames = fst bobSmith
bobsAge = snd bobSmith
names = ["Bob", "Mary", "Tom"]
addressses = ["123 Main", "234 North", "542 East"]
namesNAddress = zip names addressses


addMe :: Int -> Int -> Int
addMe x y = x + y
-- funcName param1 param2 = operations (return value)

sumMe x y = x + y
-- without type decl.

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

whatAge :: Int -> String
whatAge 16 = "you can drive"
whatAge 18 = "you can vote"
whatAge x = "Nothing Important"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

prodFact n = product [1..n]

isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarden"
    | (age >= 6) && (age <= 10) = "Elementary School"
    | (age >= 10) && (age <= 14) = "Middle School"
    | (age >= 14) && (age <= 18) = "High School"
    | otherwise = "Go to college"

batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Plater"
    | avg <= 0.280 = "Tour doing pretty good"
    | otherwise = "You are a Superstar"
    where avg = hits / atBats

getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and the rest are " ++ show xs

getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ show x

mtimes4 :: Int -> Int
mtimes4 x = x * 4

mlistTimes4 = map mtimes4 [1,2,3,4,5]
mmultBy4 :: [Int] -> [Int]
mmultBy4 [] = []
mmultBy4 (x:xs) = mtimes4 x : mmultBy4 xs

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False

doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult mtimes4

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4
threePlusList = map adds3 [1,2,3,4,5]

dbl1To10 = map (\x -> x * 2) [1..10]

-- < > <= >= == /=
-- && || not
-- if-then is not used very offen.
doubleEvenNumber y =
    if (y `mod` 2 /= 0)
        then y
        else y * 2

getClass :: Int -> String
getClass n = case n of
    5 -> "Kindergarden"
    6 -> "Elementary School"
    _ -> "go away"

-- MISS: Module.

data BaseballPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfield
                deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True
barryBonds _ = False
barryInOF = barryBonds Outfield
barryInOFIO = print barryInOF


data Customer = Customer String String Double
    deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

tomSmithBalance = getBalance tomSmith


data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot _ _ = "I don't know"

data Shape = Circle Float Float Float
    | Rectangle Float Float Float Float
    deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs (y2 - y)) 
-- $ means all things after that is parameter.
areaOfCircle = area (Circle 50 60 10)
areaOfRect = area $ Rectangle 1 2 5 6

sumValue = putStrLn (show (1 + 2))
sumValue2 = putStrLn . show $ 1 + 2
sumValue3 = putStrLn $ show $ 1 + 2
-- just try 2$s, seems working.


--Type Classes
data Employee = Employee { 
    name :: String, 
    position :: String, 
    idNum :: Int 
    } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 11}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 16}
isSamPam = samSmith == pamMarx
samSmithData = show samSmith

data ShirtSize = S | M | L

instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False

instance Show ShirtSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"

smallAvail = S `elem` [S, M, L]
theSize = show S


class MyEq a where
    areEqual :: a -> a -> Bool

instance MyEq ShirtSize where
    areEqual S S = True
    areEqual _ _ = False

newSize = areEqual M M


sayHello = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name 

writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("Random line of text")
    hClose theFile

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2


fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]
-- Fibonacci
fib300 = fib !! 300

-- ghc --make haskell-tut
--     will compile to get an executable.
main = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++ name)