class Vessel
 attr_reader :code, :x, :y, :direction, :length, :display_code
 
  @length = 2
  @code = ""
  @display_code = ""
  
  def initialize(type, direction, x, y)
    @type = set_type type
    @direction = direction
    @x = x
    @y = y
  end
  
private
def set_type(code)
  @code = code
  
  case code
  when "AC"
    @length = 5
    @display_code = "A"
  when "BA"
    @length = 4
    @display_code = "B"    
  when "CR"
    @length = 3  
    @display_code = "C"
  when "SU"
    @length = 3  
    @display_code = "S"
  when "DE"
    @length = 2
    @display_code = "D"
  else
   "Error"
  end
end

public
  def to_string
  "Length = #{@length}, direction = #{@direction} x = #{@x}, y = #{@y}"
  end

end