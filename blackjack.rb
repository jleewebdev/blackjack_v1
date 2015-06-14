require 'Pry'


player_hand = {cards: [], total: 0}
dealer_hand = {cards: [], total: 0}

# Add cards to deck
def make_deck
  new_deck = []
  suits = ["spades", "clubs", "hearts", "diamonds"]
  faces_and_values = [ 
    {face: "A", value: 1}, {face: "2", value: 2}, {face: "3", value: 3},
    {face: "4", value: 4}, {face: "5", value: 5}, {face: "6", value: 6}, 
    {face: "7", value: 7}, {face: "8", value: 8}, {face: "9", value: 9}, 
    {face: "10", value: 10}, {face: "J", value: 10}, {face: "Q", value: 10},
    {face: "K", value: 10}
]

  suits.each do |s|
    faces_and_values.each do |pair|
      new_deck.push({suit: s, face: pair[:face], value: pair[:value]})
    end
  end

  new_deck.shuffle! # Returns a new shuffled deck
end

def draw_table(player_hand, dealer_hand)
  system "clear"
  puts "--------Dealer--------\n\n"
  dealer_hand[:cards].each do |card|
    print "#{card[:face]}\s\s"
  end
  print "\s\s\sTotal => #{dealer_hand[:total]}"
  puts "\n"

  puts "--------Player--------\n\n"
  player_hand[:cards].each do |card|
    print "#{card[:face]}\s\s"
  end
  print "\s\s\sTotal => #{player_hand[:total]}"
  puts "\n"

end

# Creates a new shuffled deck
deck = make_deck


def deal_player_card(deck, player_hand)
  if deck.length > 0
    player_hand[:cards] << deck.shift
    new_card = player_hand[:cards].last
    puts "Player draws a #{new_card[:face]} of #{new_card[:suit]}"
    player_hand[:total] += new_card[:value]
  else
    deck = make_deck
    deal_player_card(player_hand)
  end
end

def deal_dealer_card(deck, dealer_hand)
  if deck.length > 0
    dealer_hand[:cards] << deck.shift
    new_card = dealer_hand[:cards].last
    puts "Dealer draws a #{new_card[:face]} of #{new_card[:suit]}"
    dealer_hand[:total] += new_card[:value]
  end
end

def initial_deal(deck, player_hand, dealer_hand)
  2.times do
    deal_player_card(deck, player_hand)
    deal_dealer_card(deck, dealer_hand)
  end
  draw_table(player_hand, dealer_hand)
end

 

initial_deal(deck, player_hand, dealer_hand)








