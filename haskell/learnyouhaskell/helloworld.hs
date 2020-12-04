import Data.Char
import Control.Monad  
import System.IO

import System.Random

add :: [String] -> IO ()  
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")  

main = do 
    handle <- openFile "haha.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

main5 :: IO ()
main5 = do
    contents <- getContents
    putStr (shortLineOnly contents)

shortLineOnly :: [Char] -> String
shortLineOnly input = 
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
    in unlines shortLines

main4 :: IO ()
main4 = do  
    contents <- getContents  
    putStr (map toUpper contents)  
    
main3 :: IO ()
main3 = do   
    colors <- forM [1,2,3,4] $ \a -> do  
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"  
        getLine
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "  
    mapM_ putStrLn colors  

main1 :: IO ()
main1 = do 
    putStrLn "hello, what's your name?"
    name <- getLine
    let bigName = map toUpper name
    putStrLn ("Hi " ++ bigName ++ ", nice to meet you!")
    
main2 = do   
    print "please input a line."
    line <- getLine  
    if null line  
        then return ()  
        else do  
            putStrLn $ reverseWords line  
            main2 
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words  