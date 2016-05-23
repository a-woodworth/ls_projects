# Question 6

# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end
# p rolling_buffer1(buffer, max_buffer_size, new_element)

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end

# p rolling_buffer2(buffer, max_buffer_size, new_element)

puts "Yes there is a difference between the two methods though the return value is the same."
puts "rolling_buffer1 will modify the buffer array permanently with the new_element upon its completion."
puts "rolling_buffer2 leaves the input_array alone, creating the new 'buffer' variable in the method where the new_element gets added."
