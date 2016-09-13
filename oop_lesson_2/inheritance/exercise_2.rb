# Let's create a few more methods for our Dog class.

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

#   def fetch
#     'fetching!'
#   end
# end
# Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

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

hammy = Pet.new
puts hammy.run
puts hammy.jump

fido = Dog.new
puts fido.speak
puts fido.fetch
puts fido.swim
puts fido.run
puts fido.jump

bud = Bulldog.new
puts bud.speak
puts bud.swim

socks = Cat.new
puts socks.speak
puts socks.run
puts socks.jump

