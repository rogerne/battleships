require_relative 'grid'
require_relative 'game_grid'
require_relative 'display_grid'
require_relative 'vessel'

player1 = GameGrid.new 10

carrier1 = Vessel.new "AC" , "H", 1 , 1
battleship1 = Vessel.new "BA" , "H", 3 , 5
cruiser1 = Vessel.new "CR" , "V", 3 , 1
sub1 = Vessel.new "SU" , "V", 5 , 5
destroyer1 = Vessel.new "DE" , "H", 9 , 6

player1.add_vessel carrier1
player1.add_vessel battleship1
player1.add_vessel cruiser1
player1.add_vessel sub1
player1.add_vessel destroyer1
#puts player1.vessels

puts "Grid"
player1.show_grid
=begin
puts "---------------------"
(1..10).each {|i|
#puts "Row #{i}"
player1.show_grid_row i
}
=end

player1_display = DisplayGrid.new 10
puts player1_display.can_take_hit?(1,1)
player1_display.update_grid(1,1,"+")
player1_display.show_grid_row 1
puts player1_display.can_take_hit?(1,1)