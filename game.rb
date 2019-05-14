require_relative 'grid'
require_relative 'game_grid'
require_relative 'display_grid'
require_relative 'vessel'
require_relative 'player'

player1 = Player.new "Neil", "H"
player2 = Player.new "PC", "C"
game_size = 10

player1.game_grid = GameGrid.new game_size
=begin
puts "Please place your fleet:"
fleet = ["AC", "BA", "CR", "SU", "DE"]
  fleet.each do |ve|
    puts "Do you want the #{ve} to be Vertical 'V' or Horizontal 'H'?"
    dir = gets.chomp!.upcase
    puts "Pick a grid reference e.g. A7"
    pos = gets.chomp!
    x = pos.byteslice(0).upcase
    y = pos.byteslice(1,pos.size).to_i
    puts "Placing #{ve} in orientation #{dir} at #{x}:#{y}"
    #v = Vessel.new ve, dir, x, y
    #puts v.to_string
    #P1GG.add_vessel v
    player1.game_grid.add_vessel Vessel.new ve, dir, x, y
    player1.game_grid.show_grid
  end
=end
p1 = player1.game_grid
p1.add_vessel Vessel.new "AC" , "H", "A" , 1
p1.add_vessel Vessel.new "BA" , "H", "C" , 5
p1.add_vessel Vessel.new "CR" , "V", "C" , 1
p1.add_vessel Vessel.new "SU" , "V", "E" , 5
p1.add_vessel Vessel.new "DE" , "H", "I" , 6
player1.display_grid = DisplayGrid.new game_size
player2.game_grid = GameGrid.new game_size

p2 = player2.game_grid
p2.add_vessel Vessel.new "AC" , "V", "B" , 3
p2.add_vessel Vessel.new "BA" , "H", "H" , 4
p2.add_vessel Vessel.new "CR" , "H", "F" , 5
p2.add_vessel Vessel.new "SU" , "V", "B" , 5
p2.add_vessel Vessel.new "DE" , "V", "C" , 7
player2.display_grid = DisplayGrid.new game_size

playing = true
#Start with player 1
go = 1

while playing do
  players = { 1 => player1, 2 => player2  }
  player = players[go]
  g_gr = player.game_grid
  g_gr.show_grid
  puts 'Player: #{player.name} Take a shot [Enter a grid ref or q to Quit]?\n'
  play = gets.chomp!
    case play.upcase
      when "Q"
        puts "Thanks for the game. Bye!"
        playing = false     
      else
        co = g_gr.get_co_ords play
        puts "You selected #{co["x"]} #{co["y"]}\n"
    end
      go == 1 ? go = 2 : go = 1

end



