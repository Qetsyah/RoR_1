SPEED = Range.new(0, 10)
BASE_PRODUCTION = 221

class AssemblyLine
  def initialize(base = BASE_PRODUCTION)
    @base = base
  end

  def ideal_production_rate_hour(speed = 0)
    ideal_number_cars = speed * 221
  end

  def actual_production_rate_hour(speed = 0)
    ideal_number_cars = speed * 221
    actual_number_cars = ideal_number_cars * precision(speed)
  end

  def working_items_per_minute(speed = 0)
    items_per_hour = actual_production_rate_hour(speed)
    rate = items_per_hour * precision(speed)
    rate / 60
  end

  def precision(speed)
    unless (speed > -1 && speed < 11)
      return 1
    end

    case speed
      when 0..4 then return 1
      when 5..8 then return 0.9
      when 9 then return 0.8
      when 10 then return 0.77
    end
  end
end


a = AssemblyLine.new()

puts a.ideal_production_rate_hour
puts a.actual_production_rate_hour
puts a.ideal_production_rate_hour(1)
puts a.actual_production_rate_hour(1)
puts a.ideal_production_rate_hour(2)
puts a.actual_production_rate_hour(2)
puts a.ideal_production_rate_hour(3)
puts a.actual_production_rate_hour(3)
puts a.ideal_production_rate_hour(4)
puts a.actual_production_rate_hour(4)
puts a.ideal_production_rate_hour(5)
puts a.actual_production_rate_hour(5)
puts a.ideal_production_rate_hour(6)
puts a.actual_production_rate_hour(6)
puts a.ideal_production_rate_hour(7)
puts a.actual_production_rate_hour(7)
puts a.ideal_production_rate_hour(8)
puts a.actual_production_rate_hour(8)
puts a.ideal_production_rate_hour(9)
puts a.actual_production_rate_hour(9)
puts a.ideal_production_rate_hour(10)
puts a.actual_production_rate_hour(10)

puts "per minute"
puts a.working_items_per_minute
puts a.working_items_per_minute(2)
puts a.working_items_per_minute(6)



