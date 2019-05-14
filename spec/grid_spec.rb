require './grid'

describe Grid do
	
	context "Once created" do

		it 'it should provide a letter for a number' do
			g = Grid.new 10
			expect(g.letters[10]).to eq "J"
		end

		it 'it should provide a number for a letter' do
			g = Grid.new 10
			expect(g.numbers["C"]).to eq 3
		end
	end

	context "When provided with a grid reference" do
		it 'should be able provide me with the x & y co-ordinates' do
			g = Grid.new 10	
			co = g.get_co_ords "B7"
			expect(co["x"]).to eq "B"
			expect(co["y"]).to eq  7
		end
  end
end
