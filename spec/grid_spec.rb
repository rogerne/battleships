require './grid'

describe Grid do
	
	context "Once created" do

		it 'it should provide a letter for a number' do
			g = Grid.new 10
			expect(g.letters[10]).to eq "J"
		end
	end
end