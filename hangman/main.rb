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

def hangman
    word = select_word
    puts word
end

hangman