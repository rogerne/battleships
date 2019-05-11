class Grid
  attr_accessor :vessels 
  attr_reader :letters
  
  def initialize(size)
    @vessels = Hash.new
    @grid = Array.new(size){Array.new(size)}
    (0...size).each do |x|
      (0...size).each do |y|
        @grid[x][y] = "X"
      end
    end
    @letters = Hash.new
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
        @letters[i] = let
        i += 1
      }
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
