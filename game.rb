require_relative 'grid'
require_relative 'game_grid'
require_relative 'display_grid'
require_relative 'vessel'
require_relative 'player'

player1 = Player.new "Neil", "H"
player2 = Player.new "Neil", "C"
game_size = 10

P1GG1 = GameGrid.new game_size

carrier1 = Vessel.new "AC" , "H", 1 , 1
battleship1 = Vessel.new "BA" , "H", 3 , 5
cruiser1 = Vessel.new "CR" , "V", 3 , 1
sub1 = Vessel.new "SU" , "V", 5 , 5
destroyer1 = Vessel.new "DE" , "H", 9 , 6

P1GG1.add_vessel carrier1
P1GG1.add_vessel battleship1
P1GG1.add_vessel cruiser1
P1GG1.add_vessel sub1
P1GG1.add_vessel destroyer1

player1.game_grid = P1GG1
player1.display_grid = DisplayGrid.new game_size

player1.game_grid.show_grid