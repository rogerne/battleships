letters = Hash.new
numbers = Hash.new
i = 1
("A".."Z").each {|let|
  #puts "#{i}: #{let}"
  letters[i] = let
  numbers[let] = i
  i += 1
}

puts letters[10]
puts numbers["J"]


=begin
cols = " "
    (1..10).each do |h|
      cols += "#{h} "
    end
  puts cols
=end