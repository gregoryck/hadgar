{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

data Thing = Thing
    { 
      _val :: String
    } deriving (Show)


makeLenses ''Thing

           
initial = Thing "initial"


main :: IO ()
main = do
    print "hello lens?"
    x <- getLine
    -- putStrLn x
    putStrLn $ initial^.val
    putStrLn $ view val initial
    let y = set val x initial
    putStrLn $ view val y

    

    

