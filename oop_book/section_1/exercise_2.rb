# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

puts "Module Definition:"
puts "A module is a collection of behaviors that is useable in other classes via mixins. A module is 'mixed in' to a class using the reserved word 'include'.  Modules are another way to achieve polymorphism in Ruby."
puts ''
puts "Module Purpose:"
puts "A module lets you group reusable code into one place. You use modules in your classes by using the include reserved word, followed by the module name. Modules are also used as a namespace."
puts ''


module Meow
end

class CatPeople
  include Meow
end

fluffy = CatPeople.new



