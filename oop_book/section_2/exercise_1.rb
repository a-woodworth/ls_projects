# Create a class called MyCar. When you initialize a new instance or object of the class,
# allow the user to define some instance variables that tell us the year, color, and model
# of the car. Create an instance variable that is set to 0 during instantiation of the
# object to track the current speed of the car as well. Create instance methods that allow
# the car to speed up, brake, and shut the car off.

class MyCar

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
chevy.speed_up(25)
chevy.current_speed
chevy.speed_up(25)
chevy.current_speed
chevy.brake(25)
chevy.current_speed
chevy.brake(20)
chevy.current_speed
chevy.shut_down
chevy.current_speed
