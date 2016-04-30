# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def selection_to_message(sel)
  case sel
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator. Please enter your name: ")

name = ''
loop do
  name = gets.chomp

  break unless name.empty?
  prompt("Make sure to use a valid name.")
end

prompt("Hi #{name}! Ready to add, subtract, multiply, or divide?")

loop do # main loop
  first_number = ''
  loop do
    prompt("Please enter your first number.")
    first_number = gets.chomp.to_i

    break if valid_number?(first_number)
    prompt("Hmmm...that doesn't look like a valid number.")
  end

  second_number = ''
  loop do
    prompt("Please enter your second number.")
    second_number = gets.chomp.to_i

    break if valid_number?(second_number)
    prompt("Hmmm...that doesn't look like a valid number.")
  end

  selection_prompt = <<-MSG

    What would you like to do? Select a number:
      Add = 1
      Subtract = 2
      Multiply = 3
      Divide = 4
  MSG

  prompt(selection_prompt)

  selection = ''
  loop do
    selection = gets.chomp

    break if %w(1 2 3 4).include?(selection)
    prompt("Must choose 1, 2, 3 or 4.")
  end

  prompt("#{selection_to_message(selection)} the two numbers...")

  result =  case selection
            when '1'
              first_number + second_number
            when '2'
              first_number - second_number
            when '3'
              first_number * second_number
            when '4'
              first_number.to_f / second_number.to_f
            end

  prompt("Your answer is: #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
