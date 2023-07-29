def substrings(word, dictionary)
  dictionary.reduce(Hash.new(0)) do |acc, word_dictionary|
    matches = word.downcase.scan(word_dictionary).length
    acc[word_dictionary] = matches unless matches == 0
    acc
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "below"]
p substrings('below', dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)