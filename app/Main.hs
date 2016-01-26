module Main where

import Data.Set (Set)

import qualified Data.Set as S

data HangmanGame = HangmanGame
    { gameWord    :: String
    , gameGuessed :: [Char]
    }

main :: IO ()
main = undefined

-- guessLetter :: Char -> HangmanGame -> HangmanGame
-- guessLetter c game
--     | ((gameStatus game == Won) || (gameStatus game == Lost)) = game
--     | otherwise =
--         let old_guessed = gameGuessed game
--         in game { gameGuessed = c : old_guessed }

data GameStatus = Won | Lost | InProgress

-- gameStatus :: HangmanGame -> GameStatus
-- gameStatus game =
--     if eachCharIsIn (gameWord game) (gameGuessed game)
--         then Won
--         else undefined

numWrongGuesses :: String -> [Char] -> Int
numWrongGuesses word cs = go (S.fromList word) cs
  where
    go :: Set Char -> [Char] -> Int
    go wordChars [] = 0
    go wordChars (c:cs)
        | c `S.member` wordChars = go wordChars cs
        | otherwise = 1 + go wordChars cs

-- isFinished :: HangmanGame -> Bool
-- isFinished game =
