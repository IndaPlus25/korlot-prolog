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

status("Group is dead").

change_status(New_status):-
    retract(status(_)),
    assert(status(New_status)).

write_status :-
    status(Text),
    write(Text).

check_contecting_stones(Row, Column, Board, Start):-
    nth1_2d(Row, Column, Board, Stone),
    (   Stone == e ->
        change_status("Group is alive"),
        write_status,
        !
    ;
        Stone == w,
        \+ member((Row,Column), Start),
        Next_space = [(Row, Column)|Start],
        Up is Row - 1,
        Right is Column + 1,
        Down is Row + 1,
        Left is Column -1,
        check_contecting_stones(Up, Column, Board, Next_space),
        check_contecting_stones(Row, Right, Board, Next_space),
        check_contecting_stones(Down, Column, Board, Next_space),
        check_contecting_stones(Row, Left, Board, Next_space)
    ).

check_area_is_living(Row, Column, Board):-
    check_stone_exist(Row, Column, Board),
    check_contecting_stones(Row, Column, Board, []),
    write_status,
    true.