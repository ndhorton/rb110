# Tic Tac Toe

SQUARE_MAPPINGS = {
  '1' => [0, 0],
  '2' => [0, 1],
  '3' => [0, 2],
  '4' => [1, 0],
  '5' => [1, 1],
  '6' => [1, 2],
  '7' => [2, 0],
  '8' => [2, 1],
  '9' => [2, 2]
}

SPACE = ' '

def prompt
  print "=> "
end

def new_board
  [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]
end

def display_board(board)
  system('clear')
  puts "Tic Tac Toe"
  puts "==========="
  puts
  display = 
    " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} \n" \
    "___|___|___\n" \
    " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} \n" \
    "___|___|___\n" \
    " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} \n" \
    "   |   |   "
  puts display.split("\n").map { |row| row.rjust(20) }
  puts
end

def free_squares(board)
  (0..2).each_with_object([]) do |row, empty_squares|
    (0..2).each do |column|
      if board[row][column] == SPACE
        empty_squares << SQUARE_MAPPINGS.key([row, column])
      end
    end
  end
end

def mark_square!(board, square, marker)
  row = SQUARE_MAPPINGS[square].first
  column = SQUARE_MAPPINGS[square].last
  board[row][column] = marker
  return
end

def winner?(board, marker)
  board.each { |row| return true if row.all?(marker) }
  board.transpose.each { |row| return true if row.all?(marker) }
  return true if [board[0][0], board[1][1], board[2][2]].all?(marker)
  return true if [board[0][2], board[1][1], board[2][0]].all?(marker)
  false
end

def full?(board)
  board.each do |row|
    return false if row.any?(SPACE)
  end
  true
end

# Main program
system('clear')
player = 'x'
computer = 'o'  

# Main game loop
loop do
  board = new_board
  free_squares = SQUARE_MAPPINGS.keys
  # Player and computer take turns until there is
  # a winner or the board is full and it's a tie
  loop do
    player_choice = nil
    display_board(board)
    puts "Choose a square (#{free_squares(board).join(', ')})"
    loop do
      prompt
      player_choice = gets.chomp
      break if free_squares(board).include?(player_choice)
      puts "Invalid choice."
    end
    mark_square!(board, player_choice, player)
    break if winner?(board, player) || winner?(board, computer) || full?(board)
    computer_choice = free_squares(board).sample
    mark_square!(board, computer_choice, computer)
    break if winner?(board, player) || winner?(board, computer) || full?(board)
  end

  # Announce winner or tie
  display_board(board)
  if winner?(board, player)
    puts "Player wins!"
  elsif winner?(board, computer)
    puts "Computer wins!"
  else
    puts "It's a tie!"
  end

  # Ask if the player wants to play again
  again = nil
  loop do
    puts "Play again? ('y' or 'n')"
    prompt
    again = gets.chomp
    break if ['y', 'n'].include?(again)
    puts "Invalid choice."
  end
  break unless ['y', 'Y'].include?(again)
end

# Say goodbye
system('clear')
puts "Goodbye!"
