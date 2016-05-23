# Question 3

# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

puts "You get the error 'TypeError: no implicit conversion of Fixnum into String' because (40 + 2) is an integer and is trying to be turned into a string."
puts "----------------------------------------------------------"
puts "First way to fix: make the equation a string with '.to_s'."
puts "'the value of 40 + 2 is ' + (40 + 2).to_s"
puts "----------------------------------------------------------"
puts "Second way to fix: use string interpolation."
# puts "the value of 40 + 2 is #{40 + 2}"
