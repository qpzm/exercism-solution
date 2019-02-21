class Isogram
  def self.isogram?(input)
    hash = Hash.new(false)
    input.downcase
         .gsub(/[-\s]/, '')
         .each_char do |c|
           return false if hash[c]
           hash[c] = true
         end
    true
  end
end
