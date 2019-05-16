require './grid'
require './game_grid'
require './vessel'

describe Vessel do
  before(:each) do
    @gg = GameGrid.new 10	
    @v = Vessel.new "AC" , "H", "A" , 1
	@gg.add_vessel(@v)
  end	

  context "when the player hits a grid ref with a vessel in it" do

 	  it 'it should say if it is a miss' do
 	  	expect(@gg.hit("B1")).to eq "@"	
 	  end

 	   	  it 'it should say if it is a hit' do
        expect(@gg.hit("A1")).to eq "H"	
 	  end

 	  it 'it should say if it is a hit or sunk' do
        expect(@gg.hit("A1")).to eq "H"	
        expect(@gg.hit("A1")).to eq "H"	
        expect(@gg.hit("A1")).to eq "H"	
        expect(@gg.hit("A1")).to eq "H"	
        expect(@gg.hit("A1")).to eq "S"	
 	  end
 	end
end