require './grid'
require './display_grid'

describe DisplayGrid do
  before(:context) do
    @g = DisplayGrid.new 10
  end	

	context "When the computer has 1 hit" do

		it "should generate 1 of 4 auto references" do
		  p2 = DisplayGrid.new 10
      p2.update_grid("C4", "H")
      expect(p2.get_play).to eq("B4").or eq("D4").or eq("C3").or eq("C5")
		end
	end

	context "When the computer has 2 vertical hits" do

		it "should generate one of two auto references" do
			p2 = DisplayGrid.new 10
      p2.update_grid("C4", "H")
      p2.update_grid("B4", "H")
      expect(p2.get_play).to eq("A4").or eq("D4")
		end
	end

	context "When the computer has 2 horizontal hits" do

		it "should generate one of two auto references" do
			p2 = DisplayGrid.new 10
      p2.update_grid("C5", "H")
      p2.update_grid("C4", "H")
      expect(p2.get_play).to eq("C3").or eq("C6")
		end
	end

	context "When the computer sinks a vessel" do

		it "the history of hits should be empty" do
			p2 = DisplayGrid.new 10
      p2.update_grid("C5", "H")
      p2.update_grid("C4", "H")
      expect(p2.history.size).to eq 2
      p2.update_grid("C6", "S")
		end
	end
end