=begin
letters = Hash.new
i = 1
("A".."Z").each {|let|
  #puts "#{i}: #{let}"
  letters[i] = let
  i += 1
}

puts letters
=end
cols = " "
    (1..10).each do |h|
      cols += "#{h} "
    end
  puts cols