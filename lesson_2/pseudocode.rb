# For example, write out pseudo-code (both casual and formal) that does the following:

# 1. a method that returns the sum of two integers
# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
# 3. a method that takes an array of integers, and returns a new array with every other element


# 1.
# START
# add two numbers and print total
# END

# def sum(num1, num2)
#   sum = num1 + num2
# end

# p sum(20, 5)

# 2.
# START
# GET multiple strings (array of strings)
# add together and print (return) 1 string
# END

# def concat_string(array)
#   concat_string = array.join(' ')
# end

# p concat_string(['hello', 'world', 'hi'])

# 3.
# START
# GET multiple numbers (array of integers)
# return every other one -- [0 no, 1 yes, 2 no, 3 yes, etc]
# PRINT array with new numbers
# END

# def every_other_one(array)
#   array.select.with_index { |_, i| i.odd? }
# end

# p every_other_one([0, 1, 2, 3, 4, 5])
# p every_other_one([2, 4, 6, 8, 10, 12])










