class Raindrops
  def self.convert(num)
    str = [3, 5, 7].zip(%w(Pling Plang Plong))
                   .map { |div, word| num % div == 0 ? word : ''}
                   .reduce(:concat)
    str.empty? ? num.to_s : str
  end
end
