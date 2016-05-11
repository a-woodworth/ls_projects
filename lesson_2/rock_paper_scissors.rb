# Build a Rock Paper Scissors game. The game flow should go like this: the user makes a choice,
# the computer makes a choice, the winner is displayed.

CLASSIC_GAME = %w(rock paper scissors)
LIZARD_SPOCK_GAME = %w(rock paper scissors lizard spock)

BEATS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

# classic_message = 'r = rock, p = paper, s = scissors.'
# lizard_spock_message = 'r = rock, p = paper, s = scissors, l = lizard, sp = spock.'

def prompt(message)
  puts "=> #{message}"
end

def game_selection(game)
  if game.to_i == 1
    prompt("You're playing: #{CLASSIC_GAME.join(', ')}.")
  elsif game.to_i == 2
    prompt("You're playing: #{LIZARD_SPOCK_GAME.join(', ')}.")
  else
    prompt("Sorry, Ultra only has two games. Choose 1 or 2 to play.")
  end
end

def win?(first, second)
  BEATS[first].include?(second)
end

def score(player, computer)
  if win?(player, computer)
    player_score += 1
  elsif win?(computer, player)
    computer_score += 1
  else
    player_score += 0
    computer_score += 0
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to Rock, Paper, Scissors Ultra Addition.")

loop do
  prompt("Play the classic game? Select 1 to start.")
  prompt("Play the Spock-lizard game? Select 2.")
  game = gets.chomp
  game_selection(game)
  break if game.to_i == 1 || game.to_i == 2
end

# loop do
#   choice = ''
#   player_score = 0
#   computer_score = 0
#   loop do
#     prompt("Choose one: #{VALUE_CHOICES.join(', ')}")
#     choice = gets.chomp

#     if VALUE_CHOICES.include?(choice)
#       break
#     else
#       prompt("That's not a valid choice.")
#     end
#   end

#   computer_choice = VALUE_CHOICES.sample
#   prompt("You chose: #{choice}. The computer chose: #{computer_choice}.")

#   display_results(choice, computer_choice)

#   prompt("Do you want to play again?")
#   answer = gets.chomp
#   break unless answer.downcase.start_with?('y')
# end
prompt("Thanks for playing! Goodbye.")
