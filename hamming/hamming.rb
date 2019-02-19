class Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.length != str2.length
    str1.each_char.zip(str2.each_char)
        .count { |a, b| a != b }
  end
end
