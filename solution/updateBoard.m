function new_board = updateBoard(old_board,r,c)
%UPDATEBOARD
% This function updates the allowable positions on the board after a new
% queen has been placed.
new_board = old_board; % initialize new board
new_board(r,:) = 0; % set all columns to 0
new_board(:,c) = 0; % set all rows to 0
queen_pos = [r c]; % store queen position
increment = [-1 1; 1 1; 1 -1; -1 -1]; % diagonal movement increments
for i = 1:4 % loop through four diagonal directions
    while r>=1 && r<=8 && c>=1 && c<=8 % while within board boundary
        new_board(r,c) = 0; % mark position as not allowed
        r = r + increment(i,1); % move row along diagonal
        c = c + increment(i,2); % move column along diagonal
    end
    r = queen_pos(1); % reset row to queen position
    c = queen_pos(2); % reset column to queen position
end