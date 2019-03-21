class Scrabble
  TABLE = {
    /[aeioulnrst]/ => 1,
    /[dg]/         => 2,
    /[bcmp]/       => 3,
    /[fhvwy]/      => 4,
    /[k]/          => 5,
    /[jx]/         => 8,
    /[qz]/         => 10,
    /.|\s/         => 0
  }.freeze

  def self.to_score(char)
    TABLE.find { |regex, _| char.match regex }[1]
  end

  def initialize(word)
    @word = word || ''
  end

  def score
    @score ||= score_helper
  end

  def self.score(word)
    Scrabble.new(word)
            .score
  end

  private

  attr_reader :word

  def score_helper
    word.downcase
        .each_char
        .sum { |c| self.class.to_score c }
  end
end
