# Make a basic 52-card deck Twenty-One game
SUITS = %w(club diamond heart spade).freeze
VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King).freeze

# Set max-values to constants so they could be changed later (41, 51 game, etc.)
GAME_MAX = 21
DEALER_MAX = 17
WINNING_SCORE = 5

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def start_game(deck, player, dealer)
  2.times do
    deal_card(deck, player)
    deal_card(deck, dealer)
  end
end

def deal_card(deck, player)
  player << deck.shift
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
  total(cards) == GAME_MAX
end

def busted?(cards)
  total(cards) > GAME_MAX
end

def compare_cards(dealer, player)
  player_total = total(player)
  dealer_total = total(dealer)

  if player_total > GAME_MAX
    :player_busted
  elsif dealer_total > GAME_MAX
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_compare_cards(dealer, player)
  result = compare_cards(dealer, player)

  case result
  when :player_busted
    prompt("You busted. Dealer wins!")
  when :dealer_busted
    prompt("Dealer busted. Player wins!")
  when :player
    prompt("You win!")
  when :dealer
    prompt("Dealer wins!")
  when :tie
    prompt("It's a tie!")
  end
end

def score_game(winner, score)
  if winner == :player || winner == :dealer_busted
    score[:player] += 1
  elsif winner == :dealer || winner == :player_busted
    score[:dealer] += 1
  end
end

def display_score(score)
  score.each_pair do |key, value|
    puts "#{key.capitalize} => #{value}"
  end
end

def play_again?
  prompt('')
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
prompt("For each round the winner gets a point.")
prompt("First one to #{WINNING_SCORE} wins!")
sleep(2.5)

loop do
  score = { player: 0, dealer: 0 }

  loop do # Initialize deck and players
    deck = initialize_deck
    players_hand = []
    dealers_hand = []

    start_game(deck, players_hand, dealers_hand)

    prompt('')
    prompt("The dealer shows: #{dealers_hand[0][1]}.")
    prompt("---------------------------------------------")
    prompt("You have: #{display_cards(players_hand)}.")
    prompt("Your current total is #{total(players_hand)}.")
    prompt('')

    if blackjack?(players_hand)
      prompt("Blackjack!")
      prompt('')
      prompt("Dealer has: #{display_cards(dealers_hand)}.")
      prompt('')
      display_compare_cards(dealers_hand, players_hand)
      score_game(compare_cards(dealers_hand, players_hand), score)
      display_score(score)
      score[:player] == WINNING_SCORE ? break : next
    end

    loop do # Player's turn
      player_turn = nil
      loop do
        prompt("Select 'h' to Hit and get another card.")
        prompt("Choose 's' to Stay with your current total.")
        player_turn = gets.chomp.downcase

        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn.start_with?('h')
        clear_screen
        deal_card(deck, players_hand)
        prompt("You chose to hit!")
        prompt('')
        prompt("You have: #{display_cards(players_hand)}.")
        prompt("Your current total is #{total(players_hand)}.")
        prompt('')
      end

      break if player_turn.start_with?('s') || busted?(players_hand)
    end

    if busted?(players_hand)
      display_compare_cards(dealers_hand, players_hand)
      score_game(compare_cards(dealers_hand, players_hand), score)
      display_score(score)
      if score[:player] == WINNING_SCORE || score[:dealer] == WINNING_SCORE
        break
      else
        next
      end
    else
      prompt("You've chosen to stay with #{total(players_hand)}.")
      prompt('')
    end

    prompt("Dealer turn...")

    loop do
      break if busted?(dealers_hand) || total(dealers_hand) >= DEALER_MAX

      prompt("The dealer hits.")
      deal_card(deck, dealers_hand)
      prompt("Dealer has: #{display_cards(dealers_hand)}.")
      prompt('')
      sleep(2)
    end

    dealer_total = total(dealers_hand)
    if busted?(dealers_hand)
      prompt("Dealer's current total is: #{dealer_total}.")
    else
      prompt("Dealer stays at #{dealer_total}.")
    end

    prompt('')
    prompt("----------------------------------------------------")
    prompt("Dealer has #{display_cards(dealers_hand)}, for a total of: #{dealer_total}.")
    prompt("Player has #{display_cards(players_hand)}, for a total of: #{total(players_hand)}.")
    prompt("----------------------------------------------------")
    prompt('')

    display_compare_cards(dealers_hand, players_hand)
    score_game(compare_cards(dealers_hand, players_hand), score)
    display_score(score)
    sleep(5)
    clear_screen

    break if score[:player] == WINNING_SCORE || score[:dealer] == WINNING_SCORE
  end

  if score[:player] == WINNING_SCORE
    prompt("You won the game!")
  else
    prompt("The dealer won!")
  end
  play_again?
end
