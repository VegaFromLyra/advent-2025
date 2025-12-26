require 'net/http'
require 'uri'

def find_password
    current_dial = 50
    clicks_to_0 = 0

    File.foreach('input.csv') do |line|
        clicks = 0

        line = line.strip
        next_pos = line[1..-1].to_i

        if (current_dial < 0 || current_dial > 99)
            raise "Bug!"
        end

        puts "Current Dial: #{current_dial}"
        puts "Next position: #{line}"

        if line.start_with?("R")
            tmp = (current_dial + next_pos)

            if tmp > 99
                clicks = (current_dial + next_pos) / 100

                current_dial = (tmp - 100) % 100
            else
                current_dial = tmp  
            end
        elsif line.start_with?("L")
            tmp = current_dial - next_pos

            if tmp == 0
                clicks = ((current_dial + next_pos) / 100) + 1
                current_dial = (tmp + 100) % 100                
            elsif tmp < 0
                clicks = ((current_dial + next_pos) / 100)
                current_dial = (tmp + 100) % 100
            else
                current_dial = tmp 
            end
        else
            raise "Unexpected input"
        end

        puts "Clicks to 0 to get to next position: #{clicks}"

        clicks_to_0 += clicks
    end

    clicks_to_0
end