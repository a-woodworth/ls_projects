# What is the return value of reject? Why?
# [1, 2, 3].reject do |num|
#   puts num
# end

# Answer:
# => [1, 2, 3]

# Reject returns a new array containing items where the block's value is "falsey". In this example,
# by using puts num, you'll always return nil as puts always returns nil. So, because the return value
# was false or nil, the element is selected and returned.
