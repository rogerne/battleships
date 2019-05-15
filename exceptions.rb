require_relative './string'
require_relative './grid'

g = Grid.new 3
g.show_grid



=begin

puts "Some text ".green + "Some more text".red.bg_magenta + " finally more text".cyan
#puts "Some text ".green +"Some more text".red +" finally more text".gray

values = [1, 2, 3]
playing = true
while playing
	
	puts "Enter number"

	while num = gets.chomp
	puts "values includes #{num.to_i} = #{values.include?(num.to_i)}" 

		values.include?(num.to_i) ? 	break : 
							(puts "Enter again")
	end

	
	playing = false
end

h = { 1 => "B", 2 => "C" }
puts h.has_value?("D")
puts h.has_value?("B")

h = Hash.new
i = 1
("A".."Z").each do |x|
	h[i] = x
	puts h.colorize(:red)
	i += 1
	break unless i <= 4
end
=end
