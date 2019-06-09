# frozen_string_literal: true
class TwelveDays
  PRESENT = [
    "Partridge in a Pear Tree",
    "Turtle Doves",
    "French Hens",
    "Calling Birds",
    "Gold Rings",
    "Geese-a-Laying",
    "Swans-a-Swimming",
    "Maids-a-Milking",
    "Ladies Dancing",
    "Lords-a-Leaping",
    "Pipers Piping",
    "Drummers Drumming"
  ]

  def self.song
    new.song
  end

  def song
    (1..12).map { |nth| line nth }.join("\n")
  end

  def line(nth)
    "On the #{Number.ordinalize(nth)} day of Christmas my true love gave to me: " \
    "#{to_phrase(presents(nth))}.\n"
  end

  private

  def to_phrase(presents)
    presents[0] = "and " + presents[0] if presents.length > 1
    presents.reverse.join(", ")
  end

  def presents(n)
    (1..n).map { |i| present i }
  end

  def present(n)
    quantifier(n) + " " + PRESENT[n - 1]
  end

  def quantifier(n)
    n == 1 ? 'a' : Number.cardinalize(n)
  end
end

module Number
  ORDINAL = %w(first second third fourth fifth sixth seventh
    eighth ninth tenth eleventh twelfth)

  CARDINAL = %w(one two three four five six seven eight nine
    ten eleven twelve)

  def self.ordinalize(n)
    ORDINAL[n - 1]
  end

  def self.cardinalize(n)
    CARDINAL[n - 1]
  end
end
