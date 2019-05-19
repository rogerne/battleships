class GameGrid < Grid

public
  def add_vessel(vessel)
    @vessels[vessel.type] = vessel
    fill_grid vessel
  end

  def can_add_vessel?(v)
    can_add_vessel = true
    vx = @numbers[v.x]
    #Test for length  
      case v.direction
        when "V"   
          if !@numbers.has_value?(vx + v.length - 1)
            can_add_vessel = false 
          end
              
        when "H"
          if !@numbers.has_value?(v.y + v.length - 1)
            can_add_vessel = false 
          end
      end  

      if can_add_vessel      
      
      #Then test for exisiting ships
        case v.direction
          when "V"   
            (vx...vx + v.length).each {|x|
              can_add_vessel = false unless @grid[x-1][v.y-1] == "X"
            }
          when "H"
            (v.y...v.y+v.length).each {|y|
              can_add_vessel = false unless @grid[vx-1][y-1] == "X"
            }
        end  
      end

    return can_add_vessel
  end

  def hit(ref)
    hit = ""
    co = get_co_ords(ref)
    val = @grid[numbers[co["x"]] - 1 ][co["y"] - 1 ]
    case val
    when "X"
      hit = "@"
    else
      my_code = (Vessel.class_eval '@@CODES')[val]
      vessel = @vessels[my_code]
      vessel.hit
      if vessel.sunk
         hit = "S"
        else
         hit = "H"
      end 
    end
    return hit  
  end

  def vessel_code(ref)
    co = get_co_ords(ref)
    val = @grid[numbers[co["x"]] - 1 ][co["y"] - 1 ]
    my_code = (Vessel.class_eval '@@CODES')[val]
    return my_code
  end

  def auto_deploy(fleet)
    i = 0
    fleet.each do |type, desc| 
      loop do
        rand(0..1) == 0 ? (dir = "H") : (dir = "V") 
        x = letters[rand(0..@grid.size)]
        y = rand(0..@grid.size)
        v = Vessel.new type , dir, x , y
        if can_add_vessel?(v) 
          add_vessel(v)
          break
        end
        i += 1
        break if i > 100
      end
    end
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
        (v.y...v.y+v.length).each {|y|
          @grid[vx-1][y-1] = v.display_code
        }
    end  
  end
end