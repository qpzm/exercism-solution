class Phrase
  def initialize(sentence)
    @words = split_words sentence
  end

  def word_count
    counts = Hash.new(0)
    count_helper words, counts
  end

  private

  attr_reader :words

  PATTERN = /\w+'*\w+|\w/

  def count_helper(words, counts)
    words.each { |w| counts[w] += 1 }
    counts
  end

  def split_words(sentence)
    sentence.downcase
            .scan(PATTERN)
  end
end
