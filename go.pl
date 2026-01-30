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

% Checks if stone located at (Row, Column) is alive or dead.
check_stone_exist(Row, Column, Board):-
    nth1_2d(Row, Column, Board, Stone),
    (Stone = b; Stone = w).

white_plays([]).
black_plays([]).
adjacent_empty([]).
%add colour in focus if needed

update_played_list ():-
        %create coordinate
        %Check colour
        %if White add coordiante to white list
        %if black add cooritnate to black list
        %else add to empty list

check_area_is_living(Row, Column, Board):-
    (   check_stone_exist(Row, Column, Board) ->       %Do this if we landed on a stone
        %update lists
        %control if stone above is same colour/empty and update list
        %Updated list? Repeat
        %control if stone to the right is colour/empty and update list
        %Updated list? Repeat
        %control if stone under is colour/empty and update list
        %Updated list? Repeat
        %control if stone to the left is colour/empty and update list
        %Updated list? Repeat
        %control if adjecent_empty is empty
        write("This group is alive :D --;--,-@")
        %else
        write("This group is dead! ;( )")
        ; 
        write("This is an empty spot")                  %else do this
    ).
