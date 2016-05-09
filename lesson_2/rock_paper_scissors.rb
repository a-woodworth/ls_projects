# Build a Rock Paper Scissors game. The game flow should go like this: the user makes a choice,
# the computer makes a choice, the winner is displayed.

VALUE_CHOICES = %w(rock paper scissors lizard spock)

BEATS = {
  'rock' => %w(scissors lizard s l),
  'paper' => %w(rock spock p sp),
  'scissors' => %w(paper lizard p l),
  'lizard' => %w(spock paper sp l),
  'spock' => %w(scissors rock s r)
}

# classic_message = 'r = rock, p = paper, s = scissors.'
# lizard_spock_message = 'r = rock, p = paper, s = scissors, l = lizard, sp = spock.'

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  BEATS[first].include?(second)
  # first == 'rock' && second == 'scissors' ||
  #   first == 'rock' && second == 'lizard' ||
  #   first == 'paper' && second == 'rock' ||
  #   first == 'paper' && second == 'spock' ||
  #   first == 'scissors' && second == 'paper' ||
  #   first == 'scissors' && second == 'lizard' ||
  #   first == 'lizard' && second == 'spock' ||
  #   first == 'lizard' && second == 'paper' ||
  #   first == 'spock' && second == 'scissors' ||
  #   first == 'spock' && second == 'rock'
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALUE_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALUE_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALUE_CHOICES.sample
  prompt("You chose: #{choice}. The computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thanks for playing! Goodbye.")
