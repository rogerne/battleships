require './grid'
require './vessel'
require './game_grid'

describe GameGrid do
	
	context "When initialized" do

		it "should provide me with a player grid of the correct size" do
			g = GameGrid.new 10
			expect(g.show_grid_row 1).to eq "X X X X X X X X X X"
		end
	end

	context "Once created" do
		it 'should accept a Vessel' do
			g = GameGrid.new 10
			carrier1 = Vessel.new "AC" , "H", 1 , 1
			g.add_vessel carrier1

		end
	end
end

