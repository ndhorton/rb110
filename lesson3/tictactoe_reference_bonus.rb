# Tic Tac Toe (Bonus Features)

# Completed up to 5b.
# TODO: 5c onwards

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[0..-2].join(delimiter) << "#{delimiter}#{word} #{arr[-1]}"
  end
end

# rubocop:disable Metrics/AbcSize
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_opportunity(brd, marker)
  opportunities = []
  WINNING_LINES.each do |line|
    line_values = brd.values_at(*line)

    if line_values.count(marker) == 2 &&
       line_values.count(INITIAL_MARKER) == 1
      line_map = line_values.zip(line).to_h
      opportunities << line_map[INITIAL_MARKER]
    end
  end
  opportunities.size.zero? ? nil : opportunities.sample
end

def computer_places_piece!(brd)
  threatened_square = immediate_opportunity(brd, PLAYER_MARKER)
  computer_opportunity = immediate_opportunity(brd, COMPUTER_MARKER)
  
  if computer_opportunity
    brd[computer_opportunity] = COMPUTER_MARKER
  elsif threatened_square
    brd[threatened_square] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

player_wins = 0
computer_wins = 0

loop do
  board = initialize_board
  display_board(board)
  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if detect_winner(board) == 'Player'
    prompt "Player wins!"
    player_wins += 1
  elsif detect_winner(board) == 'Computer'
    prompt "Computer wins!"
    computer_wins += 1
  else
    prompt "It's a tie!"
  end

  if player_wins >= 5
    prompt "Player first to 5 wins! Player wins game!"
    player_wins = 0
    computer_wins = 0
  elsif computer_wins >= 5
    prompt "Computer first to 5 wins! Computer wins game!"
    player_wins = 0
    computer_wins = 0
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
