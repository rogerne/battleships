require './grid'

describe Grid do
	
	context "When initialized" do

		it "should provide me with a player grid of the correct size" do
			g = GameGrid.new 10
			expect(g.show_grid_row 1).to eq "X X X X X X X X X X"
		end
	end
end