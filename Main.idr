import Control.ST
import Control.ST.Random

import NCurses
import NCursesST

roll : (rnd : Var) -> ST m Integer [rnd ::: Random]
roll rnd
  = pure !(getRandom rnd)

cursesRoller : Curses m => (seed : Integer) -> ST m (Integer, Integer) []
cursesRoller seed
  = do initscr
       timeout (-1)
       noecho
       curs_set 0
       rnd <- new seed
       x <- roll rnd
       mvaddstr (MkPoint 0 2) $ "x is " ++ show x
       y <- roll rnd
       mvaddstr (MkPoint 0 3) $ "y is " ++ show y
       refresh
       endwin
       delete rnd
       pure (x, y)

main : IO ()
main
  = do let seed = 123
       putStrLn $ "Seed is " ++ show seed
       _ <- run (cursesRoller seed)
       putStrLn "Done."


-- Local Variables:
-- idris-load-packages: ("contrib")
-- End:
