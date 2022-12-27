# frozen_string_literal: true
def find_top_three_words(text)
  all_words = text.downcase
                  .gsub(/[^(a-z)\s']/, ' ')
                  .split(/\s/)
                  .filter { |str| !str.empty? }
  hash = {}
  all_words.each do |word|
    hash[word] = hash[word] ? hash[word] + 1 : 1
  end

  sorted = hash.sort { |a, b| b[1] <=> a[1] }

  top_three = sorted[0..2].map {|el| el[0]}
  return top_three
end

