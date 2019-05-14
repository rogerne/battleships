require './vessel'

describe Vessel do

	context "When iniitalized" do

		it 'should provide a description' do
			v = Vessel.new "AC", "H", "C", 4
			expect(v.to_string).to eq "Type = AC, Code = A, Length = 5, direction = H x = C, y = 4"
	    end

	    it 'should have the display code A' do
			v = Vessel.new "AC", "H", "C", 4
			expect(v.display_code).to eq "A"

	    end
	end

	context "when in a game" do 
	  it "should keep track of when it's hit" do
	  	 v1 = Vessel.new "AC", "H", "C", 4
	  	 expect(v1.hits).to eq 0
	  	 v1.hit
	  	 expect(v1.hits).to eq 1
	  end

	  it "should keep track of when it's sunk" do
	  	 v2 = Vessel.new "DE", "H", "C", 4
	  	 expect(v2.sunk).to eq false
	  	 2.times {v2.hit}
	  	 expect(v2.hits).to eq 2
	  	 expect(v2.sunk).to eq true
	  end
	end

end