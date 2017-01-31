function matrix = queens
% Elton Shon  E177  Spring 2017
%
% The function "queens" places n queens on a chessboard such that no queens 
% can attack each other. It solves the problem using backtracking algorithm
% and returns an 8x8xN matrix, where N is the number of solutions found. It
% does not take any input arguements. 
%
% Implementation:
%
%   1) queens first declares a nxn array of 1s and an empty output array.
%   2) A nest function "putQueen" is called starting at row = 1.
%   3) putQueen(row) attempts to place queens on the indicated rows and
%      if there is already a queen at the position or placing a queen at 
%      the position results any attacks, it trys to place the queen at the 
%      next available position on the same row by traversing through 
%      columns 1 to n. 
%   4) Once a queen is placed, if the row number is less than n, it 
%      continues to place the next queen at the next row by recursively 
%      calling putQueen(row + 1). If the row number is equal to n, it has
%      placed all n queens and a solution is found. A soution array is then
%      concatenated with a 3 dimensional output matrix.
%   5) Backtracking is then used by removing the queen that is just placed
%      to find the next possible solution.
%
% The result is an 8x8x92 matrix. There are 92 solutions, but
% many of the solutions only differ by symmetrical operations.

% Initialize the output array
matrix = [];
% The size of the board
n = 8;
% Initialize the chessboard
board = ones(n);
    % Nested function 
    function putQueen(row)
        for column = 1:n
            % Check if the queen can be placed at the position
            if noAttack(row, column, board)
                % Place the queen
                board(row, column) = 0;
                % If row is less than n, place the next queen on next row
                if (row < n)
                    putQueen(row + 1)
                else
                    % Found a solution
                    if isempty(matrix)
                        matrix = board;
                    else
                        % Concatenate solution arrays
                        matrix = cat(3, matrix, board);
                    end
                end
                % Remove the queen
                board(row, column) = 1;
            end      
        end
    end

% place queens starting from row 1
putQueen(1);

end
        