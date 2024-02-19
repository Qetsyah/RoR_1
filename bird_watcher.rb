require 'date'

WEEKLY_COUNTS = [0, 2, 5, 3, 7, 8, 4]

def bird_watcher

  weekly_count = WEEKLY_COUNTS.each_with_index.map do |value, index|
    { weekday: index, count: value }
  end

  date = Date.today.wday
  yesterday_count = (date == 1) ? weekly_count.last[:count] : weekly_count[day-2][:count]

  total_birds = weekly_count.sum { |day| day[:count] }

  eventfull_days = weekly_count.select { |day| day[:count] >= 5 }.size

  lonely_days = weekly_count.select { |day| day[:count] == 0 }.size


  puts "Weekly bird counts:"
  weekly_count.each do |value|
    puts "This #{Date::DAYNAMES[value[:weekday]]}, #{value[:count]} birds passed by."
  end
  puts "Total birds visited this week: #{total_birds}"
  puts "Total birds visited yesterday: #{yesterday_count}"
  puts "Total of days more than 5 birds visited: #{eventfull_days}"
  (lonely_days > 0) ? puts("Unfortunately, days without birds were #{lonely_days}") : puts("This week there were no days without birds")

end

bird_watcher
