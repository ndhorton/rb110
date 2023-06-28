# Twenty-One

TEXT = {
  clubs: "Clubs",
  spades: "Spades",
  hearts: "Hearts",
  diamonds: "Diamonds",
  jack: "Jack",
  queen: "Queen",
  king: "King",
  ace: "Ace",
  hit: "hit",
  stay: "stay",
  card_value_map: "%s of %s",
  full_hand: "%s%s and %s for a total of %d",
  one_card: "Dealer has: %s of %s and %d unknown %s",
  card: "card",
  cards: "cards",
  greeting: "Welcome to Twenty-One!",
  dealer_has: "Dealer has: ",
  player_has: "You have: ",
  hit_stay: "Do you want to (h)it or (s)tay?",
  players_turn: "Player's turn",
  dealers_turn: "Dealer's turn",
  dealer_hits: "Dealer hits!",
  dealer_stays: "Dealer stays!",
  final_score: "Final score",
  player_bust: "You're bust! Dealer wins!",
  dealer_bust: "Dealer is bust! You win!",
  player_won: "You won!",
  dealer_won: "Dealer won!",
  tie: "It's a tie!",
  again: "Play again (y / n)?",
  sign_off: "Thanks for playing Twenty-One, good bye!"
}

VALID_MOVES = [TEXT[:hit], TEXT[:hit][0], TEXT[:stay], TEXT[:stay][0]]

SUITS = [TEXT[:clubs], TEXT[:spades], TEXT[:hearts], TEXT[:diamonds]]
FACE_CARDS = [TEXT[:jack], TEXT[:queen], TEXT[:king]]

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  ([*(2..10)] + FACE_CARDS + [TEXT[:ace]]).product(SUITS).shuffle
end

def deal!(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
  return
end

def hit!(deck, hand)
  hand << deck.pop
  return
end

def card_value(card)
  case
  when FACE_CARDS.include?(card.first) then 10
  when card.first == TEXT[:ace]        then 1
  else                                      card.first
  end
end

def score(hand)
  result = hand.reduce(0) { |acc, card| acc + card_value(card) }
  hand.each do |card|
    if card.first == TEXT[:ace] && (result + 10) <= 21
      result += 10
      break
    end
  end
  result 
end

def bust?(hand)
  score(hand) > 21
end

def calculate_result(player_hand, dealer_hand)
  case
  when bust?(player_hand)                      then :player_bust
  when bust?(dealer_hand)                      then :dealer_bust
  when score(player_hand) > score(dealer_hand) then :player_won
  when score(dealer_hand) > score(player_hand) then :dealer_won
  else                                              :tie
  end
end

def show_hand(hand, whose_hand)
  card_values = hand.map do |card|
    format(TEXT[:card_value_map], card[0].to_s, card[1].to_s)
  end
  prompt format(TEXT[:full_hand], whose_hand, card_values[0..-2].join(', '), 
                card_values.last.to_s, score(hand))
end

def show_one_card(hand)
  single_plural = hand.size > 2 ? TEXT[:cards] : TEXT[:card]
  prompt format(TEXT[:one_card], hand[0][0].to_s, hand[0][1].to_s,
                hand.size-1, single_plural)
end

def dealer_turn_animation
  system('clear')
  print "=> #{TEXT[:dealers_turn]}."
  3.times do
    system('sleep 0.5')
    print '.'
  end
  return
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
  deal!(deck, player_hand, dealer_hand)

  # Player's turn
  loop do
    system('clear')
    prompt TEXT[:players_turn]
    show_one_card(dealer_hand)
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

# TODO: make it display dealer's turn etc. even if dealer stays
  unless bust?(player_hand)
    system('clear')
    prompt TEXT[:dealers_turn]
    show_one_card(dealer_hand)
    show_hand(player_hand, TEXT[:player_has])
    system('sleep 1.6')
    loop do
      break if score(dealer_hand) >= 17 || bust?(dealer_hand)
      hit!(deck, dealer_hand)
      prompt TEXT[:dealer_hits]
      system('sleep 1.6')
    end
  end

  unless bust?(dealer_hand)
    prompt TEXT[:dealer_stays]
    system('sleep 1.6')
  end

  system('clear')
  prompt TEXT[:final_score]
  show_hand(dealer_hand, TEXT[:dealer_has])
  show_hand(player_hand, TEXT[:player_has])
  prompt TEXT[calculate_result(player_hand, dealer_hand)]

  puts
  prompt TEXT[:again]
  play_again = gets.chomp 
  break unless play_again.downcase.start_with?('y')
end

system('clear')
prompt TEXT[:sign_off]