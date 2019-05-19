require './grid'
require './vessel'
require './game_grid'

describe GameGrid do
  before(:each) do
    @pc_gg = GameGrid.new 10	
  end	

	context "at the start of a game a PC player" do

		it 'should deploy its own fleet' do
			fleet = {"AC" => "Aircraft Carrier", "BA" => "Battleship" , "CR" => "Cruiser", "SU" => "Submarine", "DE" => "Destroyer"}
			@pc_gg.auto_deploy(fleet)
			expect(@pc_gg.vessels["AC"].type).to eq "AC"
			expect(@pc_gg.vessels["BA"].type).to eq "BA"
			expect(@pc_gg.vessels["CR"].type).to eq "CR"
			expect(@pc_gg.vessels["SU"].type).to eq "SU"
			expect(@pc_gg.vessels["DE"].type).to eq "DE"
		end
	end

end