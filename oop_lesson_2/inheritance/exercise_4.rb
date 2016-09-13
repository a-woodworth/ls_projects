# What is the method lookup path and how is it important?

puts "The method lookup path is the order in which Ruby will traverse the class hierarchy to look for methods to invoke."
puts "For example, if you have a Bulldog object called bud and you call: bud.swim. Ruby will first look for a method called swim in the Bulldog class, then traverse up the chain of super-classes; it will invoke the first method called swim and stop its traversal."
puts "Use the .ancestors class method to see the lookup path (i.e. Bulldog.ancestors)."

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end
puts "------------------"
p Bulldog.ancestors
