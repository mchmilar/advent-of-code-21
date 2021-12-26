require 'set'

input = File.open('input').readlines.map(&:chomp)

counts = Array.new(input.first.size)

input.each do |line|
  line.each_char.with_index do |digit, i|
    counts[i] ||= { zero: 0, one: 0 }

    if digit == "1"
      counts[i][:one] += 1
    elsif digit == "0"
      counts[i][:zero] += 1
    else
      raise("what?")
    end
  end
end

gamma = ""
epsilon = ""

counts.each do |count|
  if count[:one] > count[:zero]
    gamma << "1"
    epsilon << "0"
  elsif count[:zero] > count[:one]
    gamma << "0"
    epsilon << "1"
  else
    raise("equal?")
  end
end

p gamma.to_i(2) * epsilon.to_i(2)

o2 = input.to_set
co2 = input.to_set

gamma.each_char.with_index do |c, i|
  matching_o2 = Set.new
  matching_co2 = Set.new

  input.each do |line|
    if c == "1"
      if line[i] == "1"
        matching_o2 << line
      else
        matching_co2 << line
      end
    elsif c == "0"
      if line[i] == "0"
        matching_o2 << line
      else
        matching_co2 << line
      end
    else
      raise("what?")
    end
  end

  o2 = o2.intersection(matching_o2) if o2.size > 1
  co2 = co2.intersection(matching_co2) if co2.size > 1
end

puts o2.to_a.first.to_i(2) * co2.to_a.first.to_i(2)
puts co2