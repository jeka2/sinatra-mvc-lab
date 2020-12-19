class PigLatinizer

    def piglatinize(words)
        word_arr = words.split(' ')
        latinized_arr = word_arr.map do |word|
            latinize_word(word)
        end
        latinized_arr.join(' ')
    end

private
    def latinize_word(word)
        #binding.pry if(word == "I")
        if word[0].match(/[aeiouAEIOU]/)
            latinized_word = word + 'way'
        else
            consonant_index = 0
            letters = word.split('')
            letters.each_with_index do |l, i|
                unless l.match(/[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/)
                    consonant_index = i - 1 
                    break
                end
            end
            latinized_word = word[consonant_index + 1..-1] + word[0..consonant_index] + 'ay'
        end
        latinized_word
    end
end