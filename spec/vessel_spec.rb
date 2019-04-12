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
end