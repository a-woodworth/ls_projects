# How does count treat the block's return value? How can we find out?

# ['ant', 'bat', 'caterpillar'].count do |str|
#   str.length < 4
# end

result = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p result #=> 2

# Answer:
# In a block, count returns the number of elements yielding a true value. In this case, there are two
# strings in the array with a length that's less than 4.
