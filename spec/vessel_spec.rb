require './vessel'

describe Vessel do

	context "When iniitalized" do

		it 'should provide a description' do
			v = Vessel.new "AC", "H", 3, 4
			expect(v.to_string).to eq "Length = 5, direction = H x = 3, y = 4"
	    end

	    it 'should have the display code A' do
			v = Vessel.new "AC", "H", 3, 4
			expect(v.display_code).to eq "A"

	    end
	end

	context "when in a game" do 
	  it "should keep track of when it's hit" do
	  	 v = Vessel.new "AC", "H", 3, 4
	  	 expect(v.hits).to eq 0
	  	 v.hit
	  	 expect(v.hits).to eq 1
	  end
	  it "should keep track of when it's sunk" do
	  	 v = Vessel.new "DE", "H", 3, 4
	  	 expect(v.sunk).to eq false
	  	 5.times{v.hit}
	  	 expect(v.sunk).to eq true
	  end
	end
end