class Player
attr_reader :score, :name,:type
attr_accessor :game_grid, :display_grid, :ocean_grid

  @game_grid
  @display_grid
  @ocean_grid

	def initialize(name, type)
		@name = name
		@type = type
		@display_type = set_type
		@score = 0

	end

public
  def to_string
  	return "Name = #{@name}, #{@display_type}"
  end

  def record_score
    @score += 1
  end

 private
   def set_type
   	case @type
   	when "H"
   	  @display_type = "Human"
   	when "C"
   	  @display_type = "Computer"
   	end
   end
end