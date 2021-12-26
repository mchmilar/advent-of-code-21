input = File.open('input').readlines.map(&:chomp).map { |line| line.split(' ') }

pp input.last

horizontal = 0
vertical = 0

input.each do |line|
  if line.first == "forward"
    horizontal += line.last.to_i
  elsif line.first == "down"
    vertical += line.last.to_i
  else
    vertical -= line.last.to_i
  end
end

puts horizontal * vertical


horizontal = 0
vertical = 0
aim = 0

input.each do |line|
  if line.first == "forward"
    horizontal += line.last.to_i
    vertical += aim * line.last.to_i
  elsif line.first == "down"
    aim += line.last.to_i
  else
    aim -= line.last.to_i
  end
end

puts horizontal * vertical