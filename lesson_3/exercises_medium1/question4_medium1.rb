# Question 4

# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers.shift(1)
# end

puts "Iterates through array so puts first number(1 here). Then shift will remove the first item from the array. This alters the array. The loop counter used by #each is compared against the current length of the array rather than its original length, making 3 the next number to print."
puts " The output is:
1
3
"

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

puts "Iterates through array so puts first number 1. Then pop will remove the last item from the array--4. 2 prints next while 3 gets popped off the array so there are no more numbers to cycle through here."
puts "
1
2
"
