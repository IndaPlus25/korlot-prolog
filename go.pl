% Taken and modified from https://gist.github.com/MuffinTheMan/7806903
% Edited by Filip Körlof

% Get an element from a 2-dimensional list at (Row,Column)
% using 1-based indexing.
nth1_2d(Row, Column, List, Element) :-
    nth1(Row, List, SubList),
    nth1(Column, SubList, Element).

% Reads a file and retrieves the Board from it.
load_board(BoardFileName, Board):-
    see(BoardFileName),     % Loads the input-file
    read(Board),            % Reads the first Prolog-term from the file
    seen.                   % Closes the io-stream

% Checks whether the group of stones connected to
% the stone lmn) is alive or dead.
check_stone_colour(Row, Column, Board):-
    nth1_2d(Row, Column, Board, Stone),
    (Stone = b; Stone = w). % Example statement so that the function returns. Substitute this with your own logicocated at (Row, Colu

check_area_is_living(Row, Column, Board):-
    check_stone_colour(Row, Column, Board) -> 
    check_area(); 
    write("this is an empty spot").
