class Grid
  attr_accessor :vessels 
  attr_reader :letters, :numbers
  
  def initialize(size)
    @vessels = Hash.new
    @grid = Array.new(size){Array.new(size)}
    (0...size).each do |x|
      (0...size).each do |y|
        @grid[x][y] = "X"
      end
    end
    @letters = Hash.new
    @numbers = Hash.new
    fill_letters
  end
  
public
  def show_grid
    puts build_display_header @grid.size
    i = 1
    @grid.each do |x|
      print "#{@letters[i]} "
      puts x.each { |y| y }.join(" ")
      i += 1
    end
  end
  
  def show_grid_row(row_no)
    #puts "Entering method"
    x = @grid[row_no-1]
    return x.each { |y| y }.join(" ")
  end
  
  def fill_letters
    i = 1
    ("A".."Z").each {|let|
      #puts "#{i}: #{let}"
      letters[i] = let
      numbers[let] = i
      i += 1
    }
  end

  def get_co_ords(grid_ref)
    co_ords = Hash.new
    co_ords["x"] = grid_ref.byteslice(0).upcase
    co_ords["y"] = grid_ref.byteslice(1,grid_ref.size).to_i
    return co_ords
  end
private
  def build_display_header(len)
    cols = "  "
    (1..len).each do |h|
      cols += "#{h} "
    end
    return cols
  end  
end
