# Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

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
  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is a #{color} #{year} #{model}."
  end
end

car = MyCar.new('2016', 'Toyota Prius', 'blue')
car2 = MyCar.new('2014', 'Chevy Impala', 'silver')
truck = MyTruck.new('2016', 'Chevy Silverado', 'black')

puts car
puts car2
puts truck
puts Vehicle.number_of_vehicles
