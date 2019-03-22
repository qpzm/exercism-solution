class Luhn
  def initialize(input)
    @input = input
  end

  def self.valid?(input)
    (new input).valid?
  end

  def valid?
    input.delete!(' ')
    return false if input.length < 2 || input.match?(/[^0-9]+/)

    (checksum % 10).zero?
  end

  private

  attr_accessor :input

  def checksum
    input.reverse
         .each_char.map(&:to_i)
         .each_slice(2).to_a
         .sum { |a, b = 0| a + double(b) }
  end

  def double(n)
    overflow(2 * n)
  end

  def overflow(n)
    n > 9 ? n - 9 : n
  end
end
