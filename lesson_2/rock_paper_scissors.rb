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

def prompt(message)
  puts "=> #{message}"
end

def choose_game(game)
  if game == '1'
    game = CLASSIC_GAME
    prompt("You're playing: #{game.join(', ')}.")
    prompt("Choose one: r = rock, p = paper, s = scissors.")
  elsif game == '2'
    game = LIZARD_SPOCK_GAME
    prompt("You're playing: #{game.join(', ')}.")
    prompt("Choose one: r = rock, p = paper, s = scissors,
       l = lizard, k = spock.")
  end
  game
end

def win?(first, second)
  BEATS[first].include?(second)
end

def player_picks(item)
  case item
    when 'r' then 'rock'
    when 'p' then 'paper'
    when 's' then 'scissors'
    when 'l' then 'lizard'
    when 'k' then 'spock'
  end
end

# def score(player, computer)
#   if win?(player, computer)
#     player_score += 1
#   elsif win?(computer, player)
#     computer_score += 1
#   else
#     player_score += 0
#     computer_score += 0
#   end
# end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def clear_screen
  system('clear') || system('cls')
end

prompt("Welcome to Rock, Paper, Scissors Ultra Addition.")

loop do
  choice = ''
  prompt("Play the classic game? Select 1 to start.")
  prompt("Play the Spock-lizard game? Select 2.")
  game = gets.chomp

  loop do
    if game == '1' || game == '2'
      game = choose_game(game)
    else
      prompt("Sorry, Ultra only has two games. Choose 1 or 2 to play.")
      game = gets.chomp
      game = choose_game(game)
    end

    choice = gets.chomp.downcase
    choice = player_picks(choice)

    if game.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = game.sample
  prompt("You chose: #{choice}. The computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Select --> Y to play again. Q to quit.")
  answer = gets.chomp
  if answer.downcase.start_with?('q')
    break
  elsif answer.downcase.start_with?('y')
    prompt("OK...starting a new game.")
    clear_screen
  else
    prompt("Hmmm...I'm not sure what to do.")
    break
  end
end
prompt("Thanks for playing! Goodbye.")
