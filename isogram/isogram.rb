require 'set'

class Isogram
  def self.isogram?(input)
    set = Set[]
    # self is the class in the class method
    preprocess(input).each_char { |c| return false if (set.add? c).nil? }
    true
  end

  private

  def self.preprocess(input)
    input.downcase
         .gsub(/[^a-z]/, '')
  end
end
