# Make a 52-card deck Twenty-One game

BLACKJACK = 21
SUITS = %w(club diamond heart spade)
VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

def initialize_deck
  SUITS.product(VALUES)
end

def deal_card!(deck, player)
  player << deck.shuffle!.shift
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0 # Jack, Queen, King
      sum += 10
    else
      sum += value.to_i
    end
  end

  # Correct for multiple Aces
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

loop do
  deck = initialize_deck
  players_hand = []
  dealers_hand = []

  deal_card!(deck, players_hand)
  p '-------------'
  p players_hand

  deal_card!(deck, dealers_hand)
  p '-------------'
  p dealers_hand

  p '-------------'
  p total(players_hand)
  p total(dealers_hand)
  # p deck.length
  break
end
