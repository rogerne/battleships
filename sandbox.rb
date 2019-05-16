require_relative 'grid'
require_relative 'game_grid'
require_relative 'vessel'

p2 = GameGrid.new 10
p2.add_vessel Vessel.new "AC" , "V", "B" , 3
p2.add_vessel Vessel.new "BA" , "H", "H" , 4
p2.add_vessel Vessel.new "CR" , "H", "F" , 5
p2.add_vessel Vessel.new "SU" , "V", "B" , 5
p2.add_vessel Vessel.new "DE" , "V", "C" , 7
p2.show_grid