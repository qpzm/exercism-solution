PATTERN = /\w+'*\w+|\w/

Phrase = Struct.new(:sentence) do
  def word_count
    counts = Hash.new { |hash, key| hash[key] = 0 }
    count_helper words(sentence), counts
  end
end

def count_helper(words, counts)
  words.each { |w| counts[w] += 1 }
  counts
end

def words(sentence)
  sentence.downcase
          .scan(PATTERN)
end
