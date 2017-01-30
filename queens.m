function matrix = queens
matrix = [];
n = 8;
board = ones(n);

    function putQueen(row)
        for column = 1:n
            if noAttack(row, column, board)
                board(row, column) = 0;
                if (row < n)
                    putQueen(row + 1)
                else
                    if isempty(matrix)
                        matrix = board;
                    else
                        matrix = cat(3, matrix, board);
                    end
                end
                board(row, column) = 1;
            end      
        end
    end

putQueen(1);
end
        