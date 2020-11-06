function print_board(board)
    -- Prints board nicely
   for i=1,9 do
       io.write(board[i])
       if i == 3 or i == 6 then
           print("")
           print("--------")
        elseif i ~= 9 then
            io.write("|")
        end
    end
    print("")
end

function check_win(board)
    -- Check if any player has won
   if board[1] == board[5] == board[9] or board[3] == board[5] == board[7] then
       return true
    end
    for i=1,3 do
        if board[i] == board[i+3] and board[i+3] == board[i+6] then
            return true
        end
    end
    for i=1,7,3 do
       if board[i] == board[i+1] and board[i+1] == board[i+2] then
           return true
        end
    end
    return false
end

function computer_move(board)
    -- Computer makes a move on the board
    free_spots = {}
   for i=1,9 do
       if board[i] ~= 'x' and board[i] ~= 'o' then 
           table.insert(free_spots, i)
        end 
    end
    print(math.random(#free_spots))
    computer_position = free_spots[math.random(#free_spots)]
    return computer_position
end

-- Initialise board
board = {}
for i=1,9 do
   board[i] = i 
end

math.randomseed(os.time())
winner = "Computer"

while not check_win(board) do
    print_board(board)
    io.write("Which position would you like to play?")
    user_position=tonumber(io.read())
    while board[user_position] == 'x' or board[user_position] == 'o' do
      io.write("Which position would you like to play?")
      user_position=tonumber(io.read())
    end
    print("Playing at position", user_position)
    board[user_position] = 'x'
    if check_win(board) then
        winner = "User"
       break 
    end
    --Computer plays randomly
    computer_position = computer_move(board)
    print("Computer played at position", computer_position)
    board[computer_position] = 'o'
end

print_board(board)
io.write(winner, " has won!")

















