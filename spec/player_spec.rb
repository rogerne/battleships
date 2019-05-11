require './player'
require './grid'
require './game_grid'
require './display_grid'

describe Player do

	context "When intialized" do

		it 'should provide a description' do
			p = Player.new "Neil", "H"
			expect(p.to_string).to eq "Name = Neil, Human"
			c = Player.new "Computer", "C"
			expect(c.to_string).to eq "Name = Computer, Computer"
	    end

	    it 'should have a score' do
			p = Player.new "Neil", "H"
			expect(p.score).to eq 0
	    end

	    it 'should contain the correct grids' do
	    	p = Player.new "Neil", "H"
	    	p.game_grid = GameGrid.new 10
	    	p.display_grid = DisplayGrid.new 10
	    	expect(p.game_grid).to be_a GameGrid
	    	expect(p.display_grid).to be_a DisplayGrid
	    	expect(p.game_grid).to be_a Grid
	    	expect(p.display_grid).to be_a Grid

	    end
	end
	
end