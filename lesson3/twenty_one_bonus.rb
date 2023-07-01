# Twenty-One Bonus Features

# Question 2: The context of the first two calls to `play_again?` requires the
# possibilty of skipping the rest of the current iteration. This is why the
# ternary operator is used, passing control to a `next` statement if
# `play_again?` returns `true`.
# The third  call to `play_again?` is at the end of the `loop` block, so it only
# requires the option to `break` if `play_again?` returns `false`. There is no
# more code in the game loop, so if `play_again?` returns `true` then the next
# iteration will immediately begin without requiring `next` to skip over any
# code.

SUITS = ['H', 'D', 'S', 'C']
VALUES = [
  '2', '3', '4', '5', '6', '7', '8',
  '9', '10', 'J', 'Q', 'K', 'A'
]
ROUNDS_TO_WIN = 5
MAX_POINTS = 21
DEALER_STAYS = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_POINTS
  end

  sum
end

def busted?(total_value)
  total_value > MAX_POINTS
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  if player_total > MAX_POINTS
    :player_busted
  elsif dealer_total > MAX_POINTS
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_cards(dealer_cards, player_cards, dealer_total, player_total)
  puts "============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "============="
end

def display_round_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_game_result(dealer_wins, player_wins, round)
  puts "============="
  prompt "At the end of #{round} rounds:"
  prompt "Dealer won #{dealer_wins} rounds"
  prompt "Player won #{player_wins} rounds"
  puts "============="
  if dealer_wins > player_wins
    prompt "Dealer was the first to win #{ROUNDS_TO_WIN} rounds. " \
           "Dealer wins the game!"
  else
    prompt "You were the first to win #{ROUNDS_TO_WIN} rounds. " \
           "You win the game!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

system('clear')

dealer_wins = 0
player_wins = 0
round = 0

loop do
  round += 1
  prompt "Welcome to Twenty-One!"
  prompt "Round #{round}"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, " \
         "for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    dealer_wins += 1
    display_cards(dealer_cards, player_cards, dealer_total, player_total)
    display_round_result(dealer_total, player_total)
    if dealer_wins == ROUNDS_TO_WIN || player_wins == ROUNDS_TO_WIN
      display_game_result(dealer_wins, player_wins, round)
      round = 0
      player_wins = 0
      dealer_wins = 0
    end
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= DEALER_STAYS
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
    prompt "Dealer total is now: #{dealer_total}"
  end

  if busted?(dealer_total)
    player_wins += 1
    display_cards(dealer_cards, player_cards, dealer_total, player_total)
    display_round_result(dealer_total, player_total)
    if dealer_wins == ROUNDS_TO_WIN || player_wins == ROUNDS_TO_WIN
      display_game_result(dealer_wins, player_wins, round)
      round = 0
      player_wins = 0
      dealer_wins = 0
    end
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards
  display_cards(dealer_cards, player_cards, dealer_total, player_total)
  display_round_result(dealer_total, player_total)

  if dealer_total > player_total
    dealer_wins += 1
  elsif player_total > dealer_total
    player_wins += 1
  end

  if dealer_wins == ROUNDS_TO_WIN || player_wins == ROUNDS_TO_WIN
    display_game_result(dealer_wins, player_wins, round)
    round = 0
    player_wins = 0
    dealer_wins = 0
  end

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
