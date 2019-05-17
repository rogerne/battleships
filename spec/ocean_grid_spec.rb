require './grid'
require './vessel'
require './game_grid'
require './display_grid'
require './ocean_grid'

describe OceanGrid do
  before(:each) do
  	game_size = 10
  	@gg = GameGrid.new game_size
	@gg.add_vessel Vessel.new "AC" , "H", "A" , 2
	@og = OceanGrid.new game_size
  end

  	context "When initialized" do

		it 'should provide me with a player grid of the correct size' do
			expect(@og.show_grid_row 1).to eq "X X X X X X X X X X"
		end

		it 'should accept a copy of the players Game Grid' do
			@og.replace_grid(@gg.grid)
			expect(@og.show_grid_row 1).to eq "X A A A A A X X X X"
		end

	end
end