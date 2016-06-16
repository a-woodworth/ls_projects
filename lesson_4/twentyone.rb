# Make a basic 52-card deck Twenty-One game

SUITS = %w(club diamond heart spade).freeze
VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King).freeze

def initialize_deck
  SUITS.product(VALUES)
end

def start_game(deck, player, dealer)
  2.times do
    deal_card!(deck, player)
    deal_card!(deck, dealer)
  end
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

def display_cards(cards)
  cards.map { |_suit, value| value }.join(', ')
end

def blackjack?(cards)
  total(cards) == 21
end

def busted?(cards)
  total(cards) > 21
end

def dealers_turn(deck, dealers_hand)
  while total(dealers_hand) < 17
    prompt("The dealer hits.")
    deal_card!(deck, dealers_hand)
    prompt("Dealer has: #{display_cards(dealers_hand)}.")
    prompt("Dealer's current total is: #{total(dealers_hand)}.")
    prompt('')
  end
end

def compare_cards(player, dealer)
  if  total(player) <= 21 && total(player) > total(dealer) ||
      total(dealer) > 21
    prompt("Player wins!")
  elsif total(player) == total(dealer)
    prompt("It's a tie!")
  else
    prompt("Dealer wins!")
  end
end

def play_again?
  prompt("Select --> Y to play again. Q to quit.")
  answer = gets.chomp
  if answer.downcase.start_with?('q')
    prompt("Thanks for playing Twenty-One! Goodbye.")
    exit
  elsif answer.downcase.start_with?('y')
    clear_screen
    prompt("OK...starting a new game.")
    return
  else
    prompt("Hmmm...I'm not sure what to do.")
    prompt("Thanks for playing Twenty-One! Goodbye.")
    exit
  end
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

prompt("Welcome to Twenty-One.")
prompt("--------------------------------------------")
prompt("RULES OF THE GAME:")
prompt("Beat the dealer in one of the following ways:")
prompt('')
prompt("* Get 21 points, blackjack, with your first two cards,
without a dealer blackjack")
prompt('')
prompt("* Reach a final score higher than the dealer without exceeding 21")
prompt('')
prompt("* Let the dealer draw additional cards until the hand exceeds 21")
prompt('')
sleep(5)

loop do
  loop do # Main loop
    deck = initialize_deck
    players_hand = []
    dealers_hand = []

    start_game(deck, players_hand, dealers_hand)

    if blackjack?(players_hand)
      prompt("Blackjack!")
      prompt("---------------------------------------------")
      prompt("Dealer has: #{display_cards(dealers_hand)}.")
      compare_cards(players_hand, dealers_hand)
      break
    end

    loop do
      clear_screen
      prompt("You have: #{display_cards(players_hand)}.")
      prompt("Your current total is #{total(players_hand)}.")
      prompt("---------------------------------------------")
      prompt("The dealer shows: #{dealers_hand[0][1]}.")
      prompt('')

      prompt("Select 'H' to Hit and get another card.")
      prompt("Choose 'S' to Stay with your current total.")
      answer = gets.chomp

      if answer.downcase.start_with?('h')
        deal_card!(deck, players_hand)
      end

      break if  answer.downcase.start_with?('s') ||
                busted?(players_hand)
    end

    if busted?(players_hand)
      prompt("Bust! Player loses.")
      prompt("You have: #{display_cards(players_hand)}.")
      prompt("Your current total is #{total(players_hand)}.")
    end

    if !busted?(players_hand)
      prompt("You've chosen to stay with #{total(players_hand)}.")
      prompt("Dealer has: #{display_cards(dealers_hand)}.")
      prompt("Dealer's current total is: #{total(dealers_hand)}.")
      prompt('')
      dealers_turn(deck, dealers_hand)
      compare_cards(players_hand, dealers_hand)
      sleep(1.9)
    end
    prompt(play_again?)
  end
  prompt(play_again?)
end
