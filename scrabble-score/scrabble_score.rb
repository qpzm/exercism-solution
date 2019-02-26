class Scrabble
  String.class_eval do
    def to_score
      if length != 1
        raise Exception 'The length of an argument string is not 1 in String#to_score'
      end

      case self
      when /[aeioulnrst]/ then 1
      when /[dg]/ then 2
      when /[bcmp]/ then 3
      when /[fhvwy]/ then 4
      when /[k]/ then 5
      when /[jx]/ then 8
      when /[qz]/ then 10
      else 0
      end
    end
  end

  def initialize(word)
    @word = word || ''
  end

  def score
    @score ||= self.class.score_helper word
  end

  def self.score(word)
    score_helper word
  end

  private

  attr_reader :word

  def self.score_helper(word)
    word.downcase
        .each_char
        .map(&:to_score)
        .sum
  end
end
