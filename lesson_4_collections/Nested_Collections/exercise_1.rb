# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# Answer:
arr1[2][1][3]
# ------------------------------------------------------
# irb(main):001:0> arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# => ["a", "b", ["c", ["d", "e", "f", "g"]]]
# irb(main):002:0> arr1[2]
# => ["c", ["d", "e", "f", "g"]]
# irb(main):003:0> arr1[2][1]
# => ["d", "e", "f", "g"]
# irb(main):004:0> arr1[2][1][3]
# => "g"


arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# Answer:
arr2[1][:third][0]
# ------------------------------------------------------
# irb(main):001:0> arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# => [{:first=>["a", "b", "c"], :second=>["d", "e", "f"]}, {:third=>["g", "h", "i"]}]
# irb(main):002:0> arr2[1]
# => {:third=>["g", "h", "i"]}
# irb(main):003:0> arr2[1][:third]
# => ["g", "h", "i"]
# irb(main):004:0> arr2[1][:third][0]
# => "g"


arr3 = [['abc'], ['def'], {third: ['ghi']}]

# Answer:
arr3[2][:third][0][0]
# ------------------------------------------------------
# irb(main):001:0> arr3 = [['abc'], ['def'], {third: ['ghi']}]
# => [["abc"], ["def"], {:third=>["ghi"]}]
# irb(main):002:0> arr3[2]
# => {:third=>["ghi"]}
# irb(main):003:0> arr3[2][:third]
# => ["ghi"]
# irb(main):004:0> arr3[2][:third][0]
# => "ghi"
# irb(main):005:0> arr3[2][:third][0][0]
# => "g"


hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# Answer:
hsh1['b'][1]
# ------------------------------------------------------
# irb(main):001:0> hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# => {"a"=>["d", "e"], "b"=>["f", "g"], "c"=>["h", "i"]}
# irb(main):002:0> hsh1['b']
# => ["f", "g"]
# irb(main):003:0> hsh1['b'][1]
# => "g"


hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# Answer:
hsh2[:third].key(0)
# ------------------------------------------------------
# irb(main):001:0> hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# => {:first=>{"d"=>3}, :second=>{"e"=>2, "f"=>1}, :third=>{"g"=>0}}
# irb(main):002:0> hsh2[:third]
# => {"g"=>0}
# irb(main):003:0> hsh2[:third].key(0)
# => "g"
