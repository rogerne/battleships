require_relative 'game_grid'
require_relative 'vessel'

player1 = GameGrid.new 10


=begin
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
player1.player_grid
=end

puts player1.player_grid
