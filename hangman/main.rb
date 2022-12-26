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
        puts render_hangman(parts_of_hangman_drawn)
        letter = gets.chomp
        if (!word.include?(letter)) 
            parts_of_hangman_drawn = parts_of_hangman_drawn + 1
            puts "There is no such letter in this word"
        end
        guessed_letters.push(letter)
    end
end

def render_hangman(wrong_answers)
        rope = '|' if wrong_answers > 0
        head = 'o' if wrong_answers > 1
        torso = '()' if wrong_answers > 2
        r_hand = '/' if wrong_answers > 3 
        l_hand = '\\' if wrong_answers > 4
        r_leg = '/' if wrong_answers > 5
        l_leg = '\\' if wrong_answers > 6
    hangman = "
    ------
    |   #{rope}
    |   #{head}
    | #{r_hand != nil ? r_hand : " "}#{torso}#{l_hand}
    |  #{r_leg}#{l_leg}
    +-----
    "
    return hangman 
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