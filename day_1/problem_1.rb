input = File.open('problem_1_input').readlines.map { |line| line.chomp.to_i }

last = nil
count = 0

input.each do |depth|
  if last.nil?
    last = depth
    next
  end

  count += 1 if depth > last
  last = depth
end

p count

count = 0
last = nil

input.each_cons(3) do |slice|
  if last.nil?
    last = slice.sum
    next
  end

  count += 1 if slice.sum > last
  last = slice.sum
end

p count