class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @factors = (min_factor..max_factor).to_a
    @products = []
  end

  def generate
    @products = pairs.group_by { |f| f[0] * f[1] }
                     .keep_if { |k, _| palindrome? k }
                     .map { |k, v| Palindrome.new(value: k, factors: v) }
                     .sort_by(&:value)
  end

  def largest
    @products.last
  end

  def smallest
    @products.first
  end

  private

  def pairs
    @factors.combination(2).to_a + @factors.map { |f| [f, f] }
  end

  def palindrome?(num)
    num == num.to_s
              .split(//)
              .reverse
              .join
              .to_i
  end
end

class Palindrome
  attr_accessor :value, :factors

  def initialize(value:, factors:)
    @value = value
    @factors = factors
  end
end
