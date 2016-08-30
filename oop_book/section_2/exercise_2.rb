# Add an accessor method to your MyCar class to change and view the color of your car. Then
# add an accessor method that allows you to view, but not modify, the year of your car.

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

end

chevy = MyCar.new(2016, 'Chevy Tahoe', 'black')

puts chevy.color
puts '---------------'
chevy.color = 'red'
puts chevy.color
puts chevy.year
