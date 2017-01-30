# What is the block's return value in the following code? How is it determined?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# Answer:
# => true

# The return value of the block is determined by the return value of the last experession within the block.
# In this case, the last statement evaluated is num.odd? which returns a boolean.  In this example,
# the block's return value will be a boolean since Fixnum#odd? can only return true or false.


