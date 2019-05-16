require_relative 'grid'
require_relative 'game_grid'
require_relative 'display_grid'
require_relative 'vessel'
require_relative 'player'

player1 = Player.new "Neil", "H"
player2 = Player.new "PC", "C"
game_size = 10
playing = true
@players = { 1 => player1, 2 => player2  }
#Start with a player at random
@player_no = rand(1..2)
@defender_no
@player
@p_dg
@defender
@d_gg

player1.game_grid = GameGrid.new game_size
p1 = player1.game_grid
p1.show_grid

puts "\nPlease place your fleet:"
fleet = {"AC" => "Aircraft Carrier", "BA" => "Battleship" , "CR" => "Cruiser", "SU" => "Submarine", "DE" => "Destroyer"}
ors = {"V" => "Vertical", "H" => "Horizontal"}
  fleet.each do |code, ve|
    puts "Deploy the #{ve}"
    puts "Do you want the #{ve} to be #{ors["V"]} 'V' or  #{ors["H"]} 'H'?"
    while dir = gets.chomp!.upcase
        dir == "H" || dir == "V" ?  break : (puts "Try again")
    end
    puts "Pick a grid reference e.g. A7"
    while pos = gets.chomp!
      x = pos.byteslice(0).upcase
      y = pos.byteslice(1,pos.size).to_i
      test_vessel = Vessel.new code, dir, x, y
      if player1.game_grid.is_valid_ref?(pos) && player1.game_grid.can_add_vessel?(test_vessel)
          puts "Placing #{ve} in orientation #{dir} at #{x}:#{y}"
          break
        else
          puts "Grid ref invalid or your ship will land on top of an existing one"
      end
    end
    
    p1.add_vessel test_vessel
    p1.show_grid
  end
=begin
p1.add_vessel Vessel.new "AC" , "H", "A" , 1
p1.add_vessel Vessel.new "BA" , "H", "C" , 5
p1.add_vessel Vessel.new "CR" , "V", "C" , 1
p1.add_vessel Vessel.new "SU" , "V", "E" , 5
p1.add_vessel Vessel.new "DE" , "H", "I" , 6
=end
player1.display_grid = DisplayGrid.new game_size

puts "Your Fleet is deployed. Enter any key to continue or Q to quit"
continue = gets.chomp!
abort("She cannot take any more of this, Captain!") if continue == "Q" 

player2.game_grid = GameGrid.new game_size
p2 = player2.game_grid
p2.add_vessel Vessel.new "AC" , "V", "B" , 3
p2.add_vessel Vessel.new "BA" , "H", "H" , 4
p2.add_vessel Vessel.new "CR" , "H", "F" , 5
p2.add_vessel Vessel.new "SU" , "V", "B" , 5
p2.add_vessel Vessel.new "DE" , "V", "C" , 7
player2.display_grid = DisplayGrid.new game_size


def set_players
  @player_no == 1 ? @player_no = 2 : @player_no = 1
  @defender_no == 1 ? @defender_no = 2 : @defender_no = 1
  @player = @players[@player_no]
  @p_dg = @player.display_grid
  @defender = @players[@defender_no]
  @d_gg = @defender.game_grid
end

set_players

while playing do
  puts "\nPlayer #{@player.name} to play:\n\n"
  puts "Targetting Grid".cyan 
  @p_dg.show_grid
  puts "\nPlayer #{@player.name}: Take a shot [Enter a grid ref or q to Quit]?"
  while play = gets.chomp!
    case play.upcase
      when "Q"
        puts "Thanks for the game. Bye!"
        playing = false  
        puts "breaking..."
        break   
      else
        co = @p_dg.get_co_ords play
        puts "\nYou selected #{co["x"]} #{co["y"]}. The result is...\n\n"
        if @p_dg.is_valid_ref?(play) && @p_dg.can_take_hit?(play)
          puts "Targetting Grid".cyan
            @p_dg.update_grid(play, "@")
            @p_dg.show_grid
            puts "Swapping players\n\n"
            set_players
            break
        else
          puts "Please enter a valid ref or one that you've not already hit"
        end
    end
  end
end




