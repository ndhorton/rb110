# Tic Tac Toe (Bonus Features)

INITIAL_MARKER = ' '
FIRST_PLAYER = 'X'
SECOND_PLAYER = 'O'

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
def display_board(brd, player_marker, computer_marker)
  system('clear')
  puts "You're #{player_marker}. Computer is #{computer_marker}"
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

def player_places_piece!(brd, player_marker)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = player_marker
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

def computer_places_piece!(brd, player_marker, computer_marker)
  computer_opportunity = immediate_opportunity(brd, computer_marker)
  threatened_square = immediate_opportunity(brd, player_marker)
  
  if computer_opportunity
    brd[computer_opportunity] = computer_marker
  elsif threatened_square
    brd[threatened_square] = computer_marker
  elsif brd[5] == INITIAL_MARKER
    brd[5] = computer_marker
  else
    square = empty_squares(brd).sample
    brd[square] = computer_marker
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, player_marker, computer_marker)
  !!detect_winner(brd, player_marker, computer_marker)
end

def detect_winner(brd, player_marker, computer_marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(player_marker) == 3
      return 'Player'
    elsif brd.values_at(*line).count(computer_marker) == 3
      return 'Computer'
    end
  end

  nil
end

def place_piece!(brd, current_player, player_marker, computer_marker)
  if current_player == 'Player'
    player_places_piece!(brd, player_marker)
  else
    computer_places_piece!(brd, player_marker, computer_marker)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

### Main ###
system('clear')

player_wins = 0
computer_wins = 0

who_chooses = nil
first_player = nil
loop do
  prompt "Who chooses who goes first, player or computer ('p' or 'c')?"
  who_chooses = gets.chomp.downcase
  break if ['p', 'c'].include?(who_chooses)
  prompt "Sorry, that's not a valid choice."
end

if who_chooses == 'p'
  loop do
    prompt "Who should go first, player or computer ('p' or 'c')?"
    first_player = gets.chomp.downcase
    break if ['c', 'p'].include?(first_player)
    prompt "Sorry, that's not a valid choice."
  end
else
  first_player = ['c', 'p'].sample
end

if first_player == 'p'
  player_marker = FIRST_PLAYER
  computer_marker = SECOND_PLAYER
else
  player_marker = SECOND_PLAYER
  computer_marker = FIRST_PLAYER
end

# Main program loop
loop do
  board = initialize_board
  display_board(board, player_marker, computer_marker)
  current_player = (first_player == 'p' ? 'Player' : 'Computer')

  # Individual game loop
  loop do
    display_board(board, player_marker, computer_marker)
    place_piece!(board, current_player, player_marker, computer_marker)
    current_player = alternate_player(current_player)

    if someone_won?(board, player_marker, computer_marker) || 
       board_full?(board)
      break
    end
  end

  display_board(board, player_marker, computer_marker)

  if detect_winner(board, player_marker, computer_marker) == 'Player'
    prompt "Player wins!"
    player_wins += 1
  elsif detect_winner(board, player_marker, computer_marker) == 'Computer'
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
