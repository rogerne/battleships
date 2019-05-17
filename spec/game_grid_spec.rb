require './grid'
require './vessel'
require './game_grid'

describe GameGrid do
  before(:each) do
    @g = GameGrid.new 10
  end	

	context "When initialized" do

		it 'should provide me with a player grid of the correct size' do
			expect(@g.show_grid_row 1).to eq "X X X X X X X X X X"
		end
	end

	context "Once created" do

		
		it 'should accept a Horizontal Vessel' do
			carrier1 = Vessel.new "AC" , "H", "G" , 2
			expect(@g.can_add_vessel?(carrier1)).to eq true
			@g.add_vessel carrier1
			expect(@g.show_grid_row 7).to eq "X A A A A A X X X X"
		end

		it 'should accept a Vertical Vessel' do
			carrier1 = Vessel.new "AC" , "V", "E" , 9
			expect(@g.can_add_vessel?(carrier1)).to eq true

			@g.add_vessel carrier1
			expect(@g.show_grid_row 5).to eq "X X X X X X X X A X"
			expect(@g.show_grid_row 6).to eq "X X X X X X X X A X"
			expect(@g.show_grid_row 7).to eq "X X X X X X X X A X"
			expect(@g.show_grid_row 8).to eq "X X X X X X X X A X"
			expect(@g.show_grid_row 9).to eq "X X X X X X X X A X"
			expect(@g.show_grid_row 10).to eq "X X X X X X X X X X"

		end
		it 'should not accept a Vessel that overwrites another' do
			AC1 = Vessel.new "AC" , "V", "A" , 3
			expect(@g.can_add_vessel?(AC1)).to eq true
			@g.add_vessel AC1
			BA2 = Vessel.new "BA" , "H", "C" , 1
			expect(@g.can_add_vessel?(BA2)).to eq false
		end

		it 'description' do
			SV = Vessel.new "AC", "V", "H" , 2
			expect(@g.can_add_vessel?(SV)).to eq false

		end
		

		it 'should accept a Submarine to be Horizontal a B8' do
			SH = Vessel.new "SU", "H", "B" , 8
			expect(@g.can_add_vessel?(SH)).to eq true
			

		end

	end

	context "When in play" do

		it 'should report on what it hit' do
			SH = Vessel.new "SU", "H", "B" , 2
			@g.add_vessel SH
			expect(@g.hit("B1")).to eq "@"
			expect(@g.hit("B2")).to eq "H"
            expect(@g.hit("B3")).to eq "H"
            expect(@g.hit("B3")).to eq "S"			
			
		end
	end
end

