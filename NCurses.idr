module NCurses

%access export
%default total

%include c "curses.h"
%flag C "-lncurses"

public export
data Point : Type where
  MkPoint : (x :  Nat) -> (y : Nat) -> Point

addch : Char -> IO ()
addch = foreign FFI_C "addch" (Char -> IO ())

addstr : String -> IO ()
addstr = foreign FFI_C "addstr" (String -> IO ())

move : Point -> IO Int
move (MkPoint x y)
  = foreign FFI_C "move"
    (Int -> Int -> IO Int)
    (fromNat y) (fromNat x)

mvaddstr : Point -> String -> IO Int
mvaddstr (MkPoint x y)
  = foreign FFI_C "mvaddstr"
    (Int -> Int -> String -> IO Int)
    (fromNat y) (fromNat x)

printw : String -> IO ()
printw = foreign FFI_C "printw" (String -> IO ())

refresh : IO Int
refresh = foreign FFI_C "refresh" (IO Int)

erase : IO Int
erase = foreign FFI_C "erase" (IO Int)

clear : IO Int
clear = foreign FFI_C "clear" (IO Int)

echo : IO Int
echo = foreign FFI_C "echo" (IO Int)

noecho : IO Int
noecho = foreign FFI_C "noecho" (IO Int)

curs_set : Int -> IO Int
curs_set = foreign FFI_C "curs_set" (Int -> IO Int)

cbreak : IO Int
cbreak = foreign FFI_C "cbreak" (IO Int)

initscr : IO Int
initscr = foreign FFI_C "initscr" (IO Int)

timeout : Int -> IO ()
timeout = foreign FFI_C "timeout" (Int -> IO ())

getch : IO Char
getch = foreign FFI_C "getch" (IO Char)

endwin : IO Int
endwin = foreign FFI_C "endwin" (IO Int)
