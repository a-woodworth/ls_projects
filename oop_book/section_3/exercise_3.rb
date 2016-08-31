# When running the following code...

# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"
# We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# Why do we get this error and how to we fix it?

puts "You get this error because attr_reader only lets you get the name.  It's a getter method."
puts "To fix this error, you need to change it to attr_accessor or attr_writer so you can set the name."
puts "You need a setter method which either one of these will do in this case."
puts "However, attr_writer will not let you get the name--it's not a getter method."


class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

puts bob.name # Using attr_writer will not let you get the name so it would throw an error here.
# exercise_3.rb:35:in `<main>': undefined method `name' for #<Person:0x007fdd6b833678 @name="Bob"> (NoMethodError)

