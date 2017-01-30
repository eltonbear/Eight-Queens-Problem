function boo = noAttack(r, c, board)

% check columns and rows
boo = true;
n = size(board, 1);
sumOfRow = sum(board(r,:)); 
sumOfCol = sum(board(:, c));
if sumOfRow < n || sumOfCol < n
    boo = false;
    return
end
    
% Check diagonal
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

