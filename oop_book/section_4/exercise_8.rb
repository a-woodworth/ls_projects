# Given the following code...

# bob = Person.new
# bob.hi
# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# What is the problem and how would you go about fixing it?

# Problem ==> hi is a private method in the Person class, and it's trying to be called outside the class.

# Fixing this issue

class Person

  def public_hi
    hi
  end

  private

  def hi
    puts "hi"
  end
end

bob = Person.new
bob.public_hi
