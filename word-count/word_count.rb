Phrase = Struct.new(:sentence) do
  def word_count
    count_helper(sentence.downcase
                         .scan(/\w+'*\w+|\w/),
                 {})
  end
end

def count_helper(words, hash)
  if words.empty?
    hash
  else
    insert words[0], hash
    count_helper words[1..-1], hash
  end
end

def insert(word, hash)
  if hash[word].nil?
    hash[word] = 1
  else
    hash[word] += 1
  end
end
