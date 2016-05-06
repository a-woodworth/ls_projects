# Build a Rock Paper Scissors game. The game flow should go like this: the user makes a choice,
# the computer makes a choice, the winner is displayed.
VALUE_CHOICES = %w(rock paper scissors)

def test_method
  prompt('test message')
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'paper' && second == 'rock' ||
    first == 'scissors' && second == 'paper'
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
