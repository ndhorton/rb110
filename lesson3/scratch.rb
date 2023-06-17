WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
                

def immediate_threat(brd)
  # input: board
  # output: square under threat (integer) or nil if none
  WINNING_LINES.each do |line|
    # if count of player marker in line == 2 AND
    # count of initial marker == 1
    # then 
    # 
    line_values = brd.values_at(*line)

    if line_values.count(PLAYER_MARKER) == 2 &&
       line_values.count(INITIAL_MARKER) == 1
      line_map = line_values.zip(line).to_h
      return line_map[INITIAL_MARKER]
    end
  end
  nil
end

def computer_places_piece!(brd)
  threatened_square = immediate_threat(brd)
  if threatened_square
    brd[threatened_square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def display_board(brd)
  system('clear')
  puts "You're #{PLAYER_MARKER}. Computer is #{PLAYER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

board = initialize_board
board[1] = PLAYER_MARKER
board[8] = PLAYER_MARKER

display_board(board)

p immediate_threat(board)