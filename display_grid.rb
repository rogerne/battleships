class DisplayGrid < Grid
   
public
  def can_take_hit?(row, col)
      case  @grid[row][col]
      when "X"
          return true
      else
          return false
      end
  end

  def update_grid(row, col, result)
    @grid[row-1][col-1] = result      
  end 
end