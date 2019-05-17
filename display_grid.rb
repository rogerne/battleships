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

  def get_play
    loop do
      x = rand(1..@grid.size)
      x = @letters[x]
      y = rand(1..@grid.size)
      @ref = x + y.to_s
      
      if can_take_hit?(@ref)
        break
      end
    end
    return @ref
  end
end