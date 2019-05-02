class GameGrid < Grid

public
  def add_vessel(vessel)
    @vessels[vessel.code] = vessel
    fill_grid vessel
  end
  
private
  def fill_grid(v)
    case v.direction
    when "V"
      (v.x...v.x+v.length).each {|x|
        @grid[x-1][v.y-1] = v.display_code
      }
    when "H"
      #puts "v.y: #{v.y}, v.y+v.length: #{v.y+v.length}"
      (v.y...v.y+v.length).each {|y|
        @grid[v.x-1][y-1] = v.display_code
      }
    end  
  end
end