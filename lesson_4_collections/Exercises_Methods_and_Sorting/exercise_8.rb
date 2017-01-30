# How does take work?  Is it destructive?  How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Answer:
# => [1, 2]

# Array#take selects the specified number of elements (2 for this example) from an array.

# It is not destructive.
# irb(main):001:0> arr = [1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]
# irb(main):002:0> arr.take(2)
# => [1, 2]
# irb(main):003:0> arr
# => [1, 2, 3, 4, 5]
# irb(main):004:0>
