# https://adventofcode.com/2025/day/2 - Part 1

def sum_invalid_ids(filename:)
  content = File.read(filename)
  ranges = content.gsub(/\s+/, '').split(',').reject(&:empty?)
  result = 0
  
  ranges.each do |range|
    puts range

    numbers = range.gsub(/\s+/, '').split('-').map(&:to_i) 

    (numbers[0]..numbers[1]).each do |number|
      if invalid?(id: number)
        result += number
      end
    end
  end

  result
end

def invalid?(id:)
  # Check if there is a leading 0
  if (id.to_s[0] == '0')
    true
  elsif digits_repeat?(id: id)
    true
  else
    false
  end
end

def digits_repeat?(id:)
  id_str = id.to_s
  if (id_str.length % 2 == 0)
    middle = id_str.length / 2

    id_str[0..(middle - 1)] == id_str[middle..-1]
  else
    false
  end
end

