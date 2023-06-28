# Twenty-One

TEXT = {
  greeting: "Welcome to Twenty-One!",
  dealer_has: "Dealer has: ",
  player_has: "You have: ",
  hit_stay: "Hit or stay?",
  dealers_turn: "Dealer's turn",
  player_bust: "You're bust!",
  dealer_but: "Dealer is bust!",
  you_won: "You won!",
  dealer_won: "Dealer won!",
  again: "Play again ('y'/'n')?",
  sign_off: "Thanks for playing Twenty-One, good bye!"
}
VALID_MOVES = ['hit', 'h', 'stay', 's']

SUITS = ["Clubs", "Spades", "Hearts", "Diamonds"]
FACE_CARDS = ["Jack", "King", "Queen"]

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SUITS.each_with_object([]) do |suit, new_deck|
    2.upto(10) { |value| new_deck << [value, suit] }
    FACE_CARDS.each { |face_card| new_deck << [face_card, suit] }
    new_deck << ["Ace", suit]
  end
end

def deal!(deck, hand)
  2.times { |_| hand << deck.pop }
end

def hit!(deck, hand)
  hand << deck.pop
end

def card_value(card)
  case
  when FACE_CARDS.include?(card.first) then 10
  when card.first == "Ace"             then 1
  else                                      card.first
  end
end

def score(hand)
  result = hand.reduce(0) { |acc, card| acc + card_value(card) }
  hand.each do |card|
    if card.first == "Ace" && (result + 10) <= 21
      result += 10
      break
    end
  end
  result 
end

def bust?(hand)
  score(hand) > 21
end

def show_hand(hand, message)
  card_values = hand.map { |card| card.first }
  prompt "#{message}#{card_values[0..-2].join(', ')} and #{card_values.last}"
end

def show_one_card(hand, message)
  single_plural = hand.size > 2 ? "cards" : "card"
  prompt "#{message}#{hand.first.first} and #{hand.size-1} unknown #{single_plural}"
end

def declare_winner(player_hand, dealer_hand)
  if bust?(player_hand)
    prompt "You're busted! Dealer wins!"
  elsif bust?(dealer_hand)
    prompt "Dealer is busted! You win!"
  elsif score(player_hand) > score(dealer_hand)
    prompt "You win!"
  elsif score(dealer_hand) > score(player_hand)
    prompt "Dealer wins!"
  else
    prompt "It's a tie!"
  end
end

# *** Main ***
system('clear')
puts "*** #{TEXT[:greeting]} ***"
system('sleep 1.6')
system('clear')

# # Main game loop
loop do
  deck = initialize_deck
  deck.shuffle!
  player_hand = []
  dealer_hand = []
  deal!(deck, dealer_hand)
  deal!(deck, player_hand)

  # Player's turn
  loop do
    system('clear')
    show_one_card(dealer_hand, TEXT[:dealer_has])
    show_hand(player_hand, TEXT[:player_has])
    
    move = nil
    loop do
      prompt(TEXT[:hit_stay])
      move = gets.chomp.downcase
      break if VALID_MOVES.include?(move)
    end

    hit!(deck, player_hand) if move.start_with?('h')

    break if bust?(player_hand) || move.start_with?('s')
  end
  
  unless bust?(player_hand)
    # Dealer's turn
    system('clear')
    print "=> #{TEXT[:dealers_turn]}."
    3.times do |_|
      system('sleep 0.7')
      print '.'
    end

    loop do
      break if score(dealer_hand) >= 17 || bust?(dealer_hand)
      hit!(deck, dealer_hand)
    end
  end

  system('clear')
  show_hand(dealer_hand, TEXT[:dealer_has])
  show_hand(player_hand, TEXT[:player_has])
  declare_winner(player_hand, dealer_hand)

  puts
  prompt TEXT[:again]
  play_again = gets.chomp 
  break unless play_again.downcase.start_with?('y')
end

system('clear')
prompt TEXT[:sign_off]