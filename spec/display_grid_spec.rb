require './grid'
require './display_grid'

describe DisplayGrid do
  before(:context) do
    @g = DisplayGrid.new 10
  end	

	context "When initialized" do

		it "should provide me with a player grid of the correct size" do
			expect(@g.show_grid_row 1).to eq "X X X X X X X X X X"
		end

		it "should accept hits" do
			expect(@g.can_take_hit?("A3")).to eq true
		end
	end

	context "When a grid reference is hit" do
    
    it 'it should display new value and not accept hit in the same place' do
    	@g.update_grid("A3", "#")
    	expect(@g.show_grid_row 1).to eq "X X # X X X X X X X"
    	expect(@g.can_take_hit?("A3")).to eq false
    end
	end

	context "When owned by a PC should generate a valid hit" do
    
    it 'it should display new value and not accept hit in the same place' do
    	ref = @g.get_play
    	expect(@g.is_valid_ref?(ref)).to eq true
    end
	end
end