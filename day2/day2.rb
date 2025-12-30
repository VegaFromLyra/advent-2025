def sum_invalid_ids(filename:)
  content = File.read(filename)
  ranges = content.gsub(/\s+/, '').split(',').reject(&:empty?)
  
  ranges.each do |range|
    puts range
  end
end

def invalid?(id:)
  false
end

