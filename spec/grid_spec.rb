require './grid'

describe Grid do
  before(:context) do
    @g = Grid.new 10
  end	

	context "Once created" do
  	it 'it should provide a letter for a number' do
			expect(@g.letters[10]).to eq "J"
		end

		it 'it should provide a number for a letter' do
			expect(@g.numbers["C"]).to eq 3
		end
	end

	context "When provided with a grid reference" do
		it 'should be able provide me with the x & y co-ordinates' do
			co = @g.get_co_ords "B7"
			expect(co["x"]).to eq "B"
			expect(co["y"]).to eq  7
		end

		it 'should only accept grid references in range' do
			expect(@g.is_valid_ref?("B7")).to eq true			
		end

			it 'should reject grid references out of range' do
			expect(@g.is_valid_ref?("Z4")).to eq false	
			expect(@g.is_valid_ref?("A20")).to eq false			
		end
  end
end
