# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior
# that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar
# class that stores information about the vehicle that makes it different from other types of
# Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a
# constant defined that separates it from the MyCar class in some way.

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake an decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "This vehicle is a #{color} #{year} #{model}."
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{color} #{year} #{model}."
  end
end


class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{color} #{year} #{model}."
  end
end

car = MyCar.new('2016', 'Toyota Prius', 'blue')
truck = MyTruck.new('2016', 'Chevy Silverado', 'black')

puts car
puts truck
