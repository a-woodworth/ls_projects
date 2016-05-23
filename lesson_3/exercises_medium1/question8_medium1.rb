# Question 8

# In another example we used some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.

def titalize(string)
  new_string = string.split(' ')
  new_string.each do |word|
    word.capitalize!
  end
  new_string.join(' ')
end

p titalize("how now brown cow") #== "How Now Brown Cow"
p titalize("Little red Corvette") #== "Little Red Corvette"

