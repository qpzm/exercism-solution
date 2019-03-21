class Luhn
  def initialize(input)
    @input = input
  end

  def self.valid?(input)
    luhn = self.new input
    luhn.valid?
   end

  def valid?
    input.gsub!(/\s/, '')
    return false if input.length < 2 || input.match?(/[^0-9]+/)

    (checksum % 10).zero?
  end

  private
  attr_accessor :input

  def checksum
    input.reverse
         .each_char.map(&:to_i)
         .each_slice(2).to_a.map { |a, b| double_second a, b }
         .reduce(:+)
  end

  def double_second(fst, snd)
    return fst if snd.nil?
    fst + overflow(2 * snd)
  end

  def overflow(n)
    n > 9 ? n - 9 : n
  end
end
