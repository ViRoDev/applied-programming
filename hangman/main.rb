def load_nouns
    file = File.open('english_nouns.txt', 'r')
    nouns = file.read.split("\n")
    file.close
    return nouns
end

def select_word
    nouns = load_nouns
    possible_number_of_words = nouns.length
    word_idx = rand(possible_number_of_words)
    word = nouns[word_idx]
    return word
end

def is_letter(symbol)
   symbol.downcase.match(/[a-z]/)
end

def hangman
    word = select_word
    puts word

    # Game state
    parts_of_hangman_drawn = 0
    guessed_letters = []

    loop do
        puts render_word(word, guessed_letters)
        letter = gets.chomp
        guessed_letters.push(letter)
    end
end

def render_word(word, guessed_letters)
    render = word.split('').map do |l|
        next l if !is_letter(l) 
            
        if guessed_letters.include?(l) 
            next l
        else next '_'
        end
    end
  render.join('')
end

hangman