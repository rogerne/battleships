describe "Run tests with Tags" do
    
    it 'will run with slow tests', :slow => true do
        sleep 2
        puts 'This test takes a long time'
    end
    
    it 'will run with fast tests', :quick => true do
        puts 'runs fast'
    end
    
    it 'will add another test'  do
        puts 'Should be 6'
    end
    
end