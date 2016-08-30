# You want to create a nice interface that allows you to accurately describe the action
# you want your program to perform. Create a method called spray_paint that can be
# called on an object and will modify the color of the car.

class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
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

end

chevy = MyCar.new(2016, 'Chevy Tahoe', 'black')

puts chevy.color
puts '---------------'
chevy.spray_paint('yellow')
puts chevy.color
