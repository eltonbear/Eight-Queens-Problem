function boo = noAttack(r, c, board)
% The function noAttack checks if the position already has a queen or if
% the postiton results any attack. It returns a boolean and True if the
% position can be placed a queen

% check columns and rows
boo = true;
n = size(board, 1);
% Sum the values of the row and column
sumOfRow = sum(board(r,:)); 
sumOfCol = sum(board(:, c));
% If the sum is less than 8, it means there is already a queen on the same
% row or column
if sumOfRow < n || sumOfCol < n
    boo = false;
    return
end
    
% Check diagonals
% To the left
row = r;
column = c;
while row > 0 && column > 0 && boo == true
    if board(row, column) == 0
        boo = false;
        return
    end
    row = row - 1;
    column = column - 1;
end
% To the right
row = r;
column = c;
while row <= n && column <= n && boo == true
    if board(row, column) == 0
        boo = false;
        return
    end
    row = row + 1;
    column = column + 1;
end
% Check the opposite diagonal
% To the left
row = r;
column = c;
while row <= n && column > 0 && boo == true
    if board(row, column) == 0
        boo = false;
        return
    end
    row = row + 1;
    column = column - 1;
end

% To the right
row = r;
column = c;
while row > 0 && column <= n && boo == true
    if board(row, column) == 0
        boo = false;
        return
    end
    row = row - 1;
    column = column + 1;
end

