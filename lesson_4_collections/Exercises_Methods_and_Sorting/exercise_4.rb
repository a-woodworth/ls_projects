# What is the return value of each_with_object? Why?

# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end

# Answer:
# => {"a"=>"ant", "b"=>"bear", "c"=>"cat"}

# Each with object iterates the given block for each element with an arbitrary object given, and
# returns the initially given object.

# In this example, the object was modified within the block and now contains 3 key-value pairs.
