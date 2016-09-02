# Create a module that you can mix in to ONE of your subclasses that describes a behavior
# unique to that subclass.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle

  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    @@number_of_vehicles
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
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{color} #{year} #{model}."
  end
end

car = MyCar.new('2016', 'Toyota Prius', 'blue')
truck = MyTruck.new('2016', 'Chevy Silverado', 'black')

puts truck.can_tow?(3000) # false
puts truck.can_tow?(1500) # true

puts "---Vehicle method lookup---"
puts Vehicle.ancestors


