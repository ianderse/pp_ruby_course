name1 = "larry"
name2 = "curly"
name3 = "moe"
name4 = "shemp"

health1 = 30
health2 = 60
health3 = 100
health4 = 90

current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")

puts "Players:\n\t#{name1}\n\t#{name2}\n\t#{name3}"

puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase} has a health of #{health2}"
puts "#{name3.capitalize} has a health of #{health3}".center(50, '*')
puts "#{name4.capitalize}" + "#{health4} health".rjust(30, '.')

puts "The game started on #{formatted_time}"