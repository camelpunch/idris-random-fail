module NCursesST

import Control.ST

import NCurses

public export
interface Curses (m : Type -> Type) where
  addch : Char -> STrans m () res (const res)
  addstr : String -> STrans m () res (const res)
  move : Point -> STrans m Int res (const res)
  mvaddstr : Point -> String -> STrans m Int res (const res)
  printw : String -> STrans m () res (const res)
  refresh : STrans m Int res (const res)
  erase : STrans m Int res (const res)
  clear : STrans m Int res (const res)
  echo : STrans m Int res (const res)
  noecho : STrans m Int res (const res)
  curs_set : Int -> STrans m Int res (const res)
  cbreak : STrans m Int res (const res)
  initscr : STrans m Int res (const res)
  timeout : Int -> STrans m () res (const res)
  getch : STrans m Char res (const res)
  endwin : STrans m Int res (const res)

public export
Curses IO where
  addch = lift . NCurses.addch
  addstr = lift . NCurses.addstr
  move = lift . NCurses.move
  mvaddstr x y = lift $ NCurses.mvaddstr x y
  printw = lift . NCurses.printw
  refresh = lift NCurses.refresh
  erase = lift NCurses.erase
  clear = lift NCurses.clear
  echo = lift NCurses.echo
  noecho = lift NCurses.noecho
  curs_set = lift . NCurses.curs_set
  cbreak = lift NCurses.cbreak
  initscr = lift NCurses.initscr
  timeout = lift . NCurses.timeout
  getch = lift NCurses.getch
  endwin = lift NCurses.endwin

-- Local Variables:
-- idris-load-packages: ("contrib")
-- End:
