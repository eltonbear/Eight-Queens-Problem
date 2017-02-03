function out = queens
%QUEENS
% This is a solution to the Eight Queens Problem using recursive
% backtracking. Symmetric solutions are ignored, hence 92 possible
% solutions are returned of which only 12 are unique. Using a nested
% function allows for easy access to persistent variables that are changed
% throughout each recursive call. updateBoard is used to update allowable
% positions on the board after each queen placement. The output is an 8x8xN
% double array where N is the total number of possible configurations of
% queens on the board. Each board configuration is shown with queens
% represents by 1's.
%
%

board = ones(8); % initialize array showing allowable positions
solution = zeros(8); % initialize board where queens will be placed
out = []; % initialize output array of solutions
putQueen(1); % start with row 1
    function putQueen(row)
        for col = 1:8 % loop through all columns for each row
            if board(row,col) % if queen placement is possible
                solution(row,col) = 1; % place queen on the board
                prev_board = board; % store previous allowable configuration
                board = updateBoard(board,row,col);
                if row<8 % continue recursion until last row is reached
                    putQueen(row+1); % recursive call to next row
                else
                    out = cat(3,out,solution); % concatenate solution
                end
                % backtrack after each solution is stored in output array
                solution(row,col) = 0; % remove last placed queen
                board = prev_board; % recall previous configuration
            end
        end
    end
end
