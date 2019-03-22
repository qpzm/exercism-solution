class Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.length != str2.length
    str1.each_char.with_index.count { |c, i| c != str2[i] }
  end
end
