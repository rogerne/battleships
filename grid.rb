require_relative './string'

 class Grid
  attr_accessor :vessels 
  attr_reader :letters, :numbers, :grid

  
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
    fill_letters size
  end
      
public
  def show_grid
    
    puts build_display_header @grid.size
    i = 1
    @grid.each do |x|
      print "#{@letters[i]} "
      r = ""
      x.each do |y|
        case y
        when "@"
          r << y << " "
        when "X"  
          r << y.blue << " "
        when "H"  
          r << y.red << " "
        when "S"  
          r << y.red.bold << " "                    
        else
          r << y.green << " "
        end 
      end
      puts r
      i += 1
    end
  end
  
  def show_grid_row(row_no)
    x = @grid[row_no-1]
    return x.each { |y| y }.join(" ")
  end
  
  def fill_letters(size)
    i = 1
    ("A".."Z").each {|let|
      letters[i] = let
      numbers[let] = i
      i += 1
      break unless i <= size
    }
  end

  def get_co_ords(grid_ref)
    co_ords = Hash.new
    co_ords["x"] = grid_ref.byteslice(0).upcase
    co_ords["y"] = grid_ref.byteslice(1,grid_ref.size).to_i
    return co_ords
  end

  def is_valid_ref?(ref)
    is_valid_ref = true
    co = get_co_ords(ref)
    unless @letters.has_value?(co["x"])
      is_valid_ref = false
    end

    unless @numbers.has_value?(co["y"].to_i)
      is_valid_ref = false
    end
    return is_valid_ref
  end

private
  def build_display_header(len)
    cols = "  "
    (1..len).each do |h|
      cols += "#{h} "
    end
    return cols
  end  


  def get_x_int(ref)
    co = get_co_ords(ref)
    x = numbers[co["x"]]
  end

  def get_y_int(ref)
      co = get_co_ords(ref)
      y = co["y"].to_i
  end
  
end
