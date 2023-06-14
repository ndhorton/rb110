# Tic Tac Toe

def winner?(board, marker)
  board.each { |row| return true if row.all?(marker) }
  board.transpose.each { |row| return true if row.all?(marker) }
  return true if [board[0][0], board[1][1], board[2][2]].all?(marker)
  return true if [board[0][2], board[1][1], board[2][0]].all?(marker)
  false
end


def new_board
  [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]
end

def board_full?(board)
  space = ' '
  board.each do |row|
    return false if row.any?(space)
  end
  true
end

def display_board(board)
  display = 
    " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} \n" \
    "___|___|___\n" \
    " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} \n" \
    "___|___|___\n" \
    " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} \n" \
    "   |   |   "
  puts display.split("\n").map { |row| row.rjust(40) }
end

display_board(new_board)