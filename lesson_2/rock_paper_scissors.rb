# Build a Rock Paper Scissors game. The game flow should go like this: the user makes a choice,
# the computer makes a choice, the winner is displayed.

VALID_CHOICES = %w(rock paper scissors lizard spock)

INSTRUCTIONS = "Choose one: r = rock, p = paper, s = scissors,
       l = lizard, k = spock."

RULES = <<-MSG
RULES OF THE GAME:
---------------------
* Scissors cuts Paper
* Paper covers Rock
* Rock crushes Lizard
* Lizard poisons Spock
* Spock smashes Scissors
* Scissors decapitates Lizard
* Lizard eats Paper
* Paper disproves Spock
* Spock vaporizes Rock
* Rock crushes Scissors
MSG

BEATS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  BEATS[first].include?(second)
end

def player_picks(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'k' then 'spock'
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won a point.")
  elsif win?(computer, player)
    prompt("Computer won a point.")
  else
    prompt("It's a tie! No points given.")
  end
end

def clear_screen
  system('clear') || system('cls')
end

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock Game.")
prompt('')
prompt(RULES)
prompt('')
prompt("------------------------------------------------")
prompt("The winner of each round gets a point.")
prompt("#{WINNING_SCORE} points wins the game! Let's play!")
prompt("------------------------------------------------")
prompt('')

loop do
  player_score = 0
  computer_score = 0
  prompt(INSTRUCTIONS)

  loop do
    choice = ''

    loop do
      choice = gets.chomp.downcase
      choice = player_picks(choice)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    clear_screen
    computer_choice = VALID_CHOICES.sample
    prompt("You chose: #{choice}. The computer chose: #{computer_choice}.")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    prompt('')
    prompt("------------------------------------------------")
    prompt('')
    prompt("Your score: #{player_score}.")
    prompt("The computer's score: #{computer_score}.")
    prompt('')
    prompt("------------------------------------------------")
    prompt('')
    prompt(INSTRUCTIONS)

    break if  player_score >= WINNING_SCORE ||
              computer_score >= WINNING_SCORE
  end

  if player_score == WINNING_SCORE
    prompt('')
    prompt("------------------------------------------------")
    prompt("|                                              |")
    prompt("|             YOU WON THE GAME :)              |")
    prompt("|                                              |")
    prompt("------------------------------------------------")
    prompt('')
  elsif computer_score == WINNING_SCORE
    prompt('')
    prompt("------------------------------------------------")
    prompt("|                                              |")
    prompt("|             YOU LOST THE GAME :(             |")
    prompt("|                                              |")
    prompt("------------------------------------------------")
    prompt('')
  end

  prompt("Select --> Y to play again. Q to quit.")
  answer = gets.chomp
  if answer.downcase.start_with?('q')
    break
  elsif answer.downcase.start_with?('y')
    clear_screen
    prompt("OK...starting a new game.")
  else
    prompt("Hmmm...I'm not sure what to do.")
    break
  end
end
prompt("Thanks for playing! Goodbye.")
