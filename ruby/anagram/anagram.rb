class Anagram
  def initialize(original)
    @original = original.downcase
  end

  def match(words)
    words.select { |c| anagram? String.new(c.downcase) }
  end

  private

  attr_reader :original

  def anagram?(word)
    if word.length != original.length || word == original
      false
    else
      original.each_char { |c| word.sub!(c, '') }
      word.empty?
    end
  end
end
