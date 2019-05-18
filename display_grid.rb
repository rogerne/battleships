class DisplayGrid < Grid
attr_reader :history

 def initialize(size)
  super(size)
   @history = Hash.new
 end
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
   case result
   when "H"
    puts "Entering H"
    history[history.length] = ref
   when "S"
    puts "Entering S"
    history.clear
   end         
  end 

  def get_play
   loop do
    case history.size
    when 0
     @ref = random_ref
    when 1
     @ref = post_hit_ref
    else
     @ref = dir_known_hit_ref   
    end
        
    if can_take_hit?(@ref)
     break
    end
   end
    puts "Returning"
    puts "value of @ref = #{@ref}"
    return @ref
  end

private
  def random_ref
   x = rand(1..@grid.size)
   x = @letters[x]
   y = rand(1..@grid.size)
   @ref = x + y.to_s
  end

  # Establishing orientation of vessel
  # After an initial hit the next hit should be a valid ref
  # randomly selected one move up, down, left or right. This
  # method will be used until a second hit or a sinking 
  # (when all hit records will be removed)
  def post_hit_ref
    last_ref = history[0]
    puts "Last = #{last_ref}"
    co = get_co_ords(last_ref)
    x = numbers[co["x"]]
    y = co["y"].to_i
    puts "Before #{x} #{y}"
    dir = rand(0..1)
    increment = rand(0..1)
    case dir
    when 0
     case increment
      when 0
       x += 1 if x < @grid.size
      when 1
       x -= 1 if x > 1
      end
    when 1
     case increment
      when 0
       y += 1 if y < @grid.size
      when 1
       y -= 1 if y > 1
      end
    end
    puts "After #{x} #{y}"
    puts "post_hit_ref  @ref = #{letters[x] + y.to_s}"
    @ref = letters[x] + y.to_s
  end

  # with 2 hits in a row or more, the next hit should be random in 
  # the direction of the 2 hits until another hit or a sinking
  # (when all hit records will be removed). Hint if the hits are in
  # order in the Hash then use the 1st & last entries to establish next
  def dir_known_hit_ref
    puts "Entering dir_known_hit_ref"
    sorted_history = history.values.sort
    puts "sorted_history = #{sorted_history} 1st = #{sorted_history[0]}"
    ref1 = sorted_history[0]
    puts "ref1 = #{ref1}"
    x1 = get_x_int(ref1)
    y1 = get_y_int(ref1)
    puts "x1 #{x1} y1 #{y1}"
    ref2 = sorted_history[history.length - 1]
    puts "ref2 = #{ref2}"
    x2 = get_x_int(ref2)
    y2 = get_y_int(ref2)
    puts "x2 #{x2} y2 #{y2}"

    if x1 == x2 
      orientation = "Horizontal" 
    else 
      orientation = "Vertical" 
    end

    first_or_last = rand(0..1)
    
    case orientation
    when "Vertical"
      case first_or_last
      when 0
        puts "Vertical: incrementing 1st #{x1} #{y1}"
        x1 -= 1 if x1 > 1
        @ref = letters[x1]+y1.to_s
      when 1
        puts "Vertical: incrementing last  #{x2} #{y2}}"
        x2 += 1 if x2 < @grid.size
        @ref = letters[x2]+y2.to_s
      end
    when "Horizontal"
      case first_or_last
      when 0
        puts "Horizontal: incrementing 1st  #{x1}  #{y1}}"
        y1 -= 1 if y1 > 1
        @ref = letters[x1]+y1.to_s
      when 1
        puts "Horizontal: incrementing last  #{x2}  #{y2}}"
        y2 += 1 if y2 < @grid.size
        @ref = letters[x2]+y2.to_s
      end
    end
    puts "@ref = #{@ref}"
    return @ref
  end
end