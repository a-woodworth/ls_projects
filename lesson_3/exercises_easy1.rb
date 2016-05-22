# Question 1
# What would you expect the code below to print out?
# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers
puts "Question 1: Answer"
puts "Expect to see:
 1
 2
 2
 3"

# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
puts "--------------------------------------"
puts "Question 2: Answers"
# what is != and where should you use it?
puts "!= means 'not equal' and you would use it in conditional statements."
# put ! before something, like !user_name
puts "An exclamation point before something means 'not' so here it means not user_name."
# put ! after something, like words.uniq!
puts "An exclamation point after something might indicate a destructive action, be Ruby syntax (like .uniq! here), or it could just be part of the name."
# put ? before something
puts "? : would be ternary operator for if...else."
# put ? after something
puts "A question mark after something might be Ruby syntax or just part of the name."
# put !! before something, like !!user_name
puts "Double exclamation points will turn something into its boolean equivalent."

# Question 3
# Replace the word "important" with "urgent" in this string:
# advice = "Few things in life are as important as house training your pet dinosaur."
puts "--------------------------------------"
puts "Question 3: Answer"
puts "advice.gsub!(/important/, 'urgent')"

# Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

# numbers = [1, 2, 3, 4, 5]
# What does the follow method calls do (assume we reset numbers to the original array between method calls)?
puts "--------------------------------------"
puts "Question 4: Answers"
puts "numbers.delete_at(1) => [1, 3, 4, 5]"
puts "This will delete the number at index 1 in the array. The number 2 from the array in this example."
puts "numbers.delete(1) => [2, 3, 4, 5]"
puts "This will delete the number 1 in the array."

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.
puts "--------------------------------------"
puts "Question 5: Answer"
puts "(10..100).cover?(42)"

# Question 6
# Starting with the string:
# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.
puts "--------------------------------------"
puts "Question 6: Answers"
puts '"Four score and " << famous_words'
puts "famous_words.prepend('Four score and ')"

# Question 7
# Fun with gsub:

# def add_eight(number)
#   number + 8
# end

# number = 2

# how_deep = "number"
# 5.times { how_deep.gsub!("number", "add_eight(number)") }

# p how_deep
# This gives us a string that looks like a "recursive" method call:

# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

# eval(how_deep)
# what will be the result?
puts "--------------------------------------"
puts "Question 7: Answer"
puts 42

# Question 8
# If we build an array like this:

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
puts "--------------------------------------"
puts "Question 8: Answer"
puts "flintstones.flatten!"

# Question 9
# Given the hash below

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number
puts "--------------------------------------"
puts "Question 9: Answer"
puts "flintstones.assoc('Barney')"

# Question 10
# Given the array below

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
puts "--------------------------------------"
puts "Question 10: Answer"
puts 'flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
p flintstones_hash
{"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}'





