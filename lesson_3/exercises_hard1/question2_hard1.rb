# Question 2
# What is the result of the last line in the code below?

# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings

p "The result will be: {:a=>'hi there'}. Because informal_greeting equals greetings, they now reference the same object."
p "Then, informal_greeting was altered permanently by adding 'there' to the array."
p "The greetings variable now is also changed so you get {:a=>'hi there'}."
