class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    @punctuation_chars = [".", ",", ";", ":", "?"]    
    @uppercase_word_replacement = "Marklar"
    @standard_word_replacement = "marklar"    
    @ret_words = Array.new    
  
    str.split(" ").each do |word|
      @punctuation_char = "";
      
      #this will append nothing when no punctuation character terminates the word.        
      if(@punctuation_chars.include?(word[-1])) then
        @punctuation_char = word[-1]
      end

      #apply 'marklar' logic...
      if word.length > 4 then
        # check to see if first character is uppercase
        @first_char = word[0]
        @first_char_uppered =@first_char.upcase        

        # handle replacement
        if @first_char === @first_char_uppered then
          @ret_words.push(@uppercase_word_replacement + @punctuation_char)          
        else
          @ret_words.push(@standard_word_replacement + @punctuation_char)
        end
        next
      end
      #append as-is
      @ret_words.push(word)
    end

    @ret_words.join(" ")
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth, internal_data=[])
    if internal_data.length === nth then          
      return internal_data.find_all { |i| i % 2 === 0}.sum
    end

    # handle special cases for first item(s)
    if internal_data.length === 0 then
      internal_data.push(1)
    elsif internal_data.length === 1 then
      internal_data.push(1)
    else
      internal_data.push(internal_data[-1] + internal_data[-2])
    end
    return self.even_fibonacci(nth, internal_data)
  end

end
