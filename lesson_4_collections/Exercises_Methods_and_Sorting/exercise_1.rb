# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Answer:
# => [1, 2, 3]

# Select uses the truthiness of the block's return value. Because the return value of 'hi' on line 5 in this example is a truthy value, it will return the original array.

# If you removed 'hi', you'd get an empty array because there are no numbers greater than 5.

# => []

