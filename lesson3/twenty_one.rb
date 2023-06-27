# Twenty-One

UI = {
  greeting: "Welcome to Twenty-One!",
  dealer_has: "Dealer has: ",
  player_has: "You have: ",
  hit_stay: "Hit or stay?",
  player_bust: "You're bust!",
  dealer_but: "Dealer is bust!",
  you_won: "You won!",
  dealer_won: "Dealer won!",
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

# *** Main ***
system('clear')

prompt(UI[:greeting])

# # Main game loop
loop do
  
  # Play loop
  loop do
    deck = initialize_deck
    dealer_hand = []
    deal!(deck, dealer_hand)
    player_hand = []
    deal!(deck, player_hand)

    # # Player turn loop
    loop do
      move = nil
      show_one_card(dealer_hand, UI[:dealer_has])
      show_hand(player_hand, UI[:player_has])
      
      # Validate input loop
      loop do
        prompt(UI[:hit_stay])
        move = gets.chomp.downcase
        break if VALID_MOVES.include?(move)
      end # Validate input loop
      
      break if VALID_MOVES[2..3].include?(move) || bust?(player_hand)
    end # Player turn loop
#     # Dealer turn loop
#     loop do
#     end # Dealer turn loop
    break
  end # Play loop
  break
end # Main game loop
