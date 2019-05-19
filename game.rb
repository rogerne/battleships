require_relative 'grid'
require_relative 'game_grid'
require_relative 'display_grid'
require_relative 'ocean_grid'
require_relative 'vessel'
require_relative 'player'
for arg in ARGV
   switch =  arg
   ARGV.clear
end
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
@p_og
@defender
@d_gg
@d_og
@fleet = {"AC" => "Aircraft Carrier", "BA" => "Battleship" , "CR" => "Cruiser", "SU" => "Submarine", "DE" => "Destroyer"}
player1.game_grid = GameGrid.new game_size
p1 = player1.game_grid

case switch
  when "skip"   
    p1.add_vessel Vessel.new "AC" , "H", "A" , 1
    p1.add_vessel Vessel.new "BA" , "H", "C" , 5
    p1.add_vessel Vessel.new "CR" , "V", "C" , 1
    p1.add_vessel Vessel.new "SU" , "V", "E" , 5
    p1.add_vessel Vessel.new "DE" , "H", "I" , 6
    p1.show_grid
  else
    p1.show_grid
    puts "\nPlease place your fleet:"
    ors = {"V" => "Vertical", "H" => "Horizontal"}
      @fleet.each do |code, ve|
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
end
    
player1.display_grid = DisplayGrid.new game_size
player1.ocean_grid = OceanGrid.new game_size
player1.ocean_grid.replace_grid p1.grid

puts "Your Fleet is deployed. Enter any key to continue or Q to quit"
continue = gets.chomp!
abort("She cannot take any more of this, Captain!") if continue == "Q" 

player2.game_grid = GameGrid.new game_size
p2 = player2.game_grid
p2.auto_deploy(@fleet)
=begin

p2.show_grid
p2.add_vessel Vessel.new "AC" , "V", "B" , 3
p2.add_vessel Vessel.new "BA" , "H", "H" , 4
p2.add_vessel Vessel.new "CR" , "H", "F" , 5
p2.add_vessel Vessel.new "SU" , "V", "B" , 5
p2.add_vessel Vessel.new "DE" , "V", "C" , 7
=end
player2.display_grid = DisplayGrid.new game_size
player2.ocean_grid = OceanGrid.new game_size
player2.ocean_grid.replace_grid p2.grid

def set_players
  @player_no == 1 ? @player_no = 2 : @player_no = 1
  @player_no == 1 ? @defender_no = 2 : @defender_no = 1
  @player = @players[@player_no]
  @p_dg = @player.display_grid
  @p_og = @player.ocean_grid
  @p_gg = @player.game_grid
  @defender = @players[@defender_no]
  @d_gg = @defender.game_grid
  @d_og = @defender.ocean_grid
  @p_gg = @player.game_grid
end

set_players

while playing do
  loop do
    case @player.type
      when "H"
        puts "\nPlayer #{@player.name} to play:\n\n"
        puts "#{@player.name}'s Targetting Grid".cyan 
        #Show their view of the enemy board
        @p_dg.show_grid 
        puts "#{@player.name}'s Ocean Grid".cyan
        #Show the state of the players fleet 
        @p_og.show_grid 
        puts "\nPlayer #{@player.name}: Take a shot [Enter a grid ref or q to Quit]?"

        while play = gets.chomp!
          if play.size > 0
            break
          end
        end
      when "C"
        play = @p_dg.get_play
    end
 
    case play.upcase
    when "Q"
      puts "Thanks for the game. Bye!"
      playing = false  
      break  
    else      
      if @p_dg.is_valid_ref?(play) && @p_dg.can_take_hit?(play)
        result = @d_gg.hit(play)
          
          case result
          when "@"
            result_string = "a miss"
          when "H"
            result_string = "a hit".bg_red
          when "S"            
            result_string = "#{@player.name} sunk the #{@fleet[@d_gg.vessel_code(play)]}".red
            @player.record_score
            puts "\nScore: ".magenta + "#{@player.name} #{@player.score}: #{@defender.name} #{@defender.score}"
              if @player.score == @fleet.size
                puts "\nPlayer #{@player.name} is the winner. Congratulations"
                playing = false
                exit
              end
          end

          co = @p_dg.get_co_ords play
          puts "\nPlayer #{@player.name} selected #{co["x"]}#{co["y"]}. The result is #{result_string}\n\n"
          @p_dg.update_grid(play, result)

          if @player.type == "H"
            puts "#{@player.name}'s Targetting Grid".cyan
            @p_dg.show_grid
            puts "\nScore: ".magenta + "#{@player.name} #{@player.score}: #{@defender.name} #{@defender.score}"
          end
      
          #update the defenders Ocean Grid so they see it on their turn
          @d_og.update_grid(play, result) 
          
          if @player.type == "C"
          #display defenders's Ocean Grid so they can see the result          
            @d_og.show_grid
          end
          puts "Hit any key to continue."
          cont = gets.chomp!

          puts "Swapping players\n\n"
          set_players
          break
      else
        puts "Please enter a valid ref or one that you've not already hit"
      end
    end
  end
end




