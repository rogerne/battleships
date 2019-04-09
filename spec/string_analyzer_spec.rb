require 'string_analyzer'

describe StringAnalyzer do
    context "With some valid input" do
      before(:each) do 
        @sa = StringAnalyzer.new 
      end
      
      it "should detect when there is a vowel" do
        #sa = StringAnalyzer.new
        str = 'uuu' 
        expect(@sa.has_vowels? str).to be true
        
      end
      
      it "should detect when it doesn't" do
        #sa = StringAnalyzer.new
        str = 'bcd' 
        expect(@sa.has_vowels? str).to be false
        
      end
      
    end
end
