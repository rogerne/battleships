class Vessel
 attr_reader :type, :x, :y, :direction, :length, :display_code, :hits, :sunk
  @@CODES= {"A" => "AC","B" => "BA","C" => "CR","U" => "SU","D" => "DE"}
  @length = 2
  #@code = ""
  @display_code = ""
 

  def initialize(type, direction, x, y)
    @type = type
    @direction = direction
    @x = x
    @y = y
    @hits = 0
    @sunk = false
    set_code
  end

private
  def set_code
    case @type
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
      @display_code = "U"
    when "DE"
      @length = 2
      @display_code = "D"
    else
     "Error"  
    end
  end

public
  def to_string
  "Type = #{@type}, Code = #{@display_code}, Length = #{@length}, direction = #{@direction} x = #{@x}, y = #{@y}"
  end

  def hit
    if  @hits  < @length - 1
      @hits += 1
    elsif  @hits  = @length - 1
      @hits += 1
      @sunk = true
    end
  end

  def self.TEST
    @@TEST
  end
end