class Raindrops
  def self.convert(num)
    str = { Pling: 3, Plang: 5, Plong: 7 }
          .map { |word, div| (num % div).zero? ? word : '' }
          .join
    str.empty? ? num.to_s : str
  end
end
