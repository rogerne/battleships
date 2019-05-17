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
          #puts "{vx + v.length - 1} #{vx + v.length - 1}"
          if !@numbers.has_value?(vx + v.length - 1)
            can_add_vessel = false 
            puts "F V"
          end
              
        when "H"
          if !@numbers.has_value?(v.y + v.length - 1)
            can_add_vessel = false 
            puts "F H"
          end
      end  

      #puts "can_add_vessel #{can_add_vessel}"
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
      #puts " = #{my_code}"
      vessel = @vessels[my_code]
      #puts vessel.to_string
      vessel.hit
      #puts "vessel.sunk = #{vessel.sunk}"
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