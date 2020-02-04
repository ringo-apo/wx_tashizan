module Main where

import Graphics.UI.WX
import Graphics.UI.WXCore

main :: IO ()
main = start gui

gui :: IO ()
gui = do
    f <- frame [text := "Review"]
    p <- panel f []
    e1 <- entry p [text := "0"]
    st1 <- staticText p [text := "+"]
    e2 <- entry p [text := "0"]
    quit <- button f[text := "=", on command := close f]
    st2 <- staticText p [text := "0"]
    set quit [on command := bye f st2 e1 e2 quit]
    set f
        [layout := margin 5 $ container p $ grid 5 5
            [
                [hfill(widget e1), alignRight(widget st1), hfill(widget e2), hfill(widget quit), alignRight(widget st2)]
            ],
            clientSize := sz 300 200   
        ]
    where 
      bye f st2 e1 e2 quit 
        = do 
             v1 <- read <$> get e1 text
             v2 <- read <$> get e2 text
             set st2 [text := (show (v1 + v2 :: Int))]
             set quit [on command := close f]
