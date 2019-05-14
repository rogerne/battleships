class GameGrid < Grid

public
  def add_vessel(vessel)
    @vessels[vessel.type] = vessel
    fill_grid vessel
  end
  
private
  def fill_grid(v)
    vx = @numbers[v.x]

    case v.direction
      when "V"
        (vx...vx + v.length).each {|x|
          @grid[x-1][v.y-1] = v.display_code
        }
      when "H"
        #puts "v.y: #{v.y}, v.y+v.length: #{v.y+v.length}"
        (v.y...v.y+v.length).each {|y|
          @grid[vx-1][y-1] = v.display_code
        }
    end  
  end
end