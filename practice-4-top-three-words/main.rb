# frozen_string_literal: true

text = "In a#village234 of La Mancha,\
 the name of which I have no desire to call to mind, \
 there lived not long since one of those gentlemen that keep a lance in the lance-rack, \
 an old buckler, a lean hack, and a greyhound for coursing. \
 An olla of rather more beef than mutton, \
 a salad on most nights, scraps on Saturdays, \
 lentils on Fridays, and a pigeon or so extra on Sundays, \
 made away with three-quarters of his income."

all_words = text.downcase
                .gsub(/[^(a-z)\s']/, ' ')
                .split(/\s/)
                .filter { |str| !str.empty? }
hash = {}
all_words.each do |word|
  hash[word] = hash[word] ? hash[word] + 1 : 1
end

sorted = hash.sort { |a, b| b[1] <=> a[1] }

[0, 1, 2].each do |idx|
  print "NUMBER##{idx + 1} WORD IS... #{sorted[idx][0]}!\n"
end
