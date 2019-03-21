module Luhn
  def self.valid?(num)
    str = num.gsub(/\s/, '')
    return false if str.length < 2

    ((checksum str) % 10).zero?
    rescue StandardError
      false
  end
end

def checksum(str)
  str.each_char
     .map { |c| to_int c }
     .reverse
     .map.with_index { |n, i| double n, i }
     .map { |n| overflow n }
     .reduce(:+)
end

def to_int(c)
  if (c.match /[0-9]/) then c.to_i
  else raise StandardError end
end

def double(n, i)
  (i % 2).zero? ? n : 2 * n
end

def overflow(n)
  n > 9 ? n - 9 : n
end
