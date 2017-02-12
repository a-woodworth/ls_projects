# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# Answer:
# 1
# 3
# => [3, 4]

# As you iterate over the array, you are mutating it (shift) so you end up dropping the first two values.
# The removal of the first item in the first pass changes the value found for the second pass.

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# Answer:
# 1
# 2
# => [1, 2]

# As you iterate over the array, you are dropping the last two values (pop). You are shortening the array
# with each pass.
