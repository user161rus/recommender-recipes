import DataDescription
import TheParser
import TheLoader
import Register
import GlobalVars
import Reciepts
import ReadBase

askForCommand = do
    putStrLn "Bведите команду (help для посмотра списка доступных команд)"
    l <- getLine
    case parseTask (words l) of
        Right (Quit) -> do
            putStrLn "Пока! :)"
        Right gp -> do
            readBase gp
            askForCommand
        Left str -> do
                    print str
                    askForCommand

main = loadBases >> askForCommand >> saveBases
