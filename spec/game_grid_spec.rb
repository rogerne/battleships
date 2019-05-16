require './grid'
require './vessel'
require './game_grid'

describe GameGrid do
  before(:context) do
    @g = GameGrid.new 10
  end	

	context "When initialized" do

		it 'should provide me with a player grid of the correct size' do
			expect(@g.show_grid_row 1).to eq "X X X X X X X X X X"
		end
	end

	context "Once created" do

		it 'should accept a Vessel' do
			carrier1 = Vessel.new "AC" , "H", "A" , 1
			@g.add_vessel carrier1
			expect(@g.show_grid_row 1).to eq "A A A A A X X X X X"
		end

		it 'should not accept a Vessel that overwrites another' do
			C1 = Vessel.new "AC" , "H", "C" , 1
			expect(@g.can_add_vessel?(C1)).to eq true
			@g.add_vessel C1
			BA1 = Vessel.new "BA" , "V", "A" , 3
			expect(@g.can_add_vessel?(BA1)).to eq false
			BA2 = Vessel.new "BA" , "V", "I" , 3
			expect(@g.can_add_vessel?(BA2)).to eq false
		end
	end
end

