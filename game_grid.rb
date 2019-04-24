class GameGrid
  attr_accessor :vessels 
  
  def initialize(size)
    @vessels = Hash.new
    @grid = Array.new(size){Array.new(size)}
    (0...size).each do |x|
      (0...size).each do |y|
        @grid[x][y] = "X"
      end
    end
=begin
=end 
  end
  
public
  def player_grid
    @grid.each do |x|
      return x.each { |y| y }.join(" ")
    end
  end
  
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
      puts "v.y: #{v.y}, v.y+v.length: #{v.y+v.length}"
      (v.y...v.y+v.length).each {|y|
        @grid[v.x-1][y-1] = v.display_code
      }
    end  
  end
    
end
