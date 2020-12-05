import Data.Monoid  

a :: [Integer -> Integer]
a = fmap (*) [1,2,3,4]

b :: [Integer]
b = fmap (\f -> f 9) a

c :: [Integer]
c = sequenceA [(+3),(+2),(+1)] 3
d :: [[Integer]]
d = sequenceA [[1,2,3],[4,5,6]]

newtype CoolBool = CoolBool { getCoolBool :: Bool } 
helloMe :: CoolBool -> [Char]
helloMe (CoolBool _) = "hello"

data CoolBool2 = CoolBool2 { getCoolBool2 :: Bool } 
helloMe2 :: CoolBool2 -> [Char]
helloMe2 (CoolBool2 _) = "hello"

lengthCompare :: String -> String -> Ordering  
lengthCompare x y = (length x `compare` length y) `mappend`  
                    (vowels x `compare` vowels y) `mappend`  
                    (x `compare` y)  
    where vowels = length . filter (`elem` "aeiou") 