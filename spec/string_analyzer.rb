class StringAnalyzer
    
    def has_vowels?(str)
      !!(str =~ /[aeiou]+/i)
    end
end

sa = StringAnalyzer.new
puts sa.has_vowels?('bc')