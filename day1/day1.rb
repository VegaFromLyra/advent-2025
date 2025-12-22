require 'net/http'
require 'uri'

def find_password
    current_dial = 50
    result = 0

    File.foreach('input.csv') do |line|
        line = line.strip
        next_pos = line[1..-1].to_i

        if (current_dial < 0 || current_dial > 99)
            raise "Bug!"
        end

        puts current_dial
        puts line

        if line.start_with?("R")
            tmp = (current_dial + next_pos)

            if tmp > 99
                current_dial = (tmp - 100) % 100
            else
                current_dial = tmp  
            end
        elsif line.start_with?("L")
            tmp = current_dial - next_pos

            if tmp < 0
                current_dial = (tmp + 100) % 100
            else
                current_dial = tmp 
            end
        else
            raise "Unexpected input"
        end

        if current_dial == 0
            result += 1
        end
    end

    result
end