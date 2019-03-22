class Raindrops
  HASH = { 3=> "Pling", 5=> "Plang", 7=> "Plong" }.freeze

  def self.convert(num)
    str = HASH.select { |div, _| (num % div).zero? }
              .values
              .join
    str.empty? ? num.to_s : str
  end
end
