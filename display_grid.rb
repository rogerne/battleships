class DisplayGrid < Grid
   
public
  def can_take_hit?(ref)
    co = get_co_ords(ref)
    case @grid[numbers[co["x"]] - 1 ][co["y"] - 1 ].upcase
      when "X"
          return true
      else
          return false
    end
  end

  def update_grid(ref, result)
    co = get_co_ords(ref)
     @grid[numbers[co["x"]] - 1 ][co["y"] - 1 ] = result      
  end 
end