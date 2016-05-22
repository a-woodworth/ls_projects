# Question 1
# In this hash of people and their age,

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if there is an age present for "Spot".

# Bonus: What are two other hash methods that would work just as well for this solution?
puts "Question 1: Answers"
puts "ages.key?('Spot')"
puts "ages.include?('Spot')"
puts "ages.member?('Spot')"

# Question 2

# Add up all of the ages from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts "--------------------------------------"
puts "Question 2: Answer"
puts "ages.values.reduce(:+)"

# Question 3
# In the age hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).
puts "--------------------------------------"
puts "Question 3: Answer"
puts "My solution => ages.reject! {|key, value| value > 100}"
puts "Exercise solution => ages.keep_if { |_, age| age < 100 }"

# Question 4
# Starting with this string:

# munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be executed on original munsters_description above):
puts "--------------------------------------"
puts "Question 4: Answers"
# "The munsters are creepy in a good way."
puts "munsters_description.capitalize!"
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts "munsters_description.swapcase!"
# "the munsters are creepy in a good way."
puts "munsters_description.downcase!"
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts "munsters_description.upcase!"

# Question 5
# We have most of the Munster family in our age hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash

# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
puts "--------------------------------------"
puts "Question 5: Answer"
puts "ages.merge!(additional_ages)"

# Question 6
# Pick out the minimum age from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts "--------------------------------------"
puts "Question 6: Answer"
puts "ages.values.min"

# Question 7
# See if the name "Dino" appears in the string below:

# advice = "Few things in life are as important as house training your pet dinosaur."
puts "--------------------------------------"
puts "Question 7: Answer"
puts "advice.match('Dino')"

# Question 8
# In the array:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"
puts "--------------------------------------"
puts "Question 8: Answer"
puts "flintstones.index { |name| name[0, 2] == 'Be' }"

# Question 9
# Using array#map!, shorten each of these names to just 3 characters:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts "--------------------------------------"
puts "Question 9: Answer"
puts "flintstones.map! do |name|"
puts "  name[0, 3]"
puts "end"

# Question 10
# Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts "--------------------------------------"
puts "Question 10: Answer"
puts "flintstones.map! { |name| name[0, 3] }"

