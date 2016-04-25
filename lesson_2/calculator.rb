# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

puts "Welcome to Calculator. Ready to add, subtract, multiply, or divide?"
puts "-------------------------------"
puts "Please enter your first number."

first_number = gets.chomp.to_i
puts "Please enter your second number."

second_number = gets.chomp.to_i
puts "-------------------------------"

puts "What would you like to do? Select a number: Add = 1, Subtract = 2, Multiply = 3, Divide = 4."
selection = gets.chomp.to_i

result =
  if selection == 1
    first_number + second_number
  elsif selection == 2
    first_number - second_number
  elsif selection == 3
    first_number * second_number
  else
    first_number.to_f / second_number.to_f
  end

puts "Your answer is: #{result}"
