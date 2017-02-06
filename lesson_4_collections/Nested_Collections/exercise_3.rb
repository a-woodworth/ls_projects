# Given this code, what would be the final values of a and b? Try to work it out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# Answer:
# The value of a is still 2 since it was never modified. The a value in arr was changed because arr[0] += 2
# added 2 to that value making it 4.  The value of b was modified because it is an array and the value
# at index 0 was changed -- arr[1][0] -= a or 5 - 2.

# irb(main):001:0> a = 2
# => 2
# irb(main):002:0> b = [5, 8]
# => [5, 8]
# irb(main):003:0> arr = [a, b]
# => [2, [5, 8]]
# irb(main):004:0>
# irb(main):005:0* arr[0] += 2
# => 4
# irb(main):006:0> arr[1][0] -= a
# => 3
# irb(main):007:0> a
# => 2
# irb(main):008:0> b
# => [3, 8]
# irb(main):009:0> arr
# => [4, [3, 8]]
