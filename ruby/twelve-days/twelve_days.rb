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
    (1..12).map { |nth| "#{line nth}" }.join("\n")
  end

  def self.line(nth)
    <<~EOF
      On the #{Number.ordinalize(nth)} day of Christmas my true love gave to me: #{presents(nth)}.
    EOF
  end

  private
  def self.presents(n)
    return present(1) if n == 1
    present(n) + separator(n - 1) + presents(n - 1)
  end

  def self.present(n)
    Number.quantify(n) + " " + PRESENT[n - 1]
  end

  def self.separator(n)
    n == 1 ? ', and ' : ', '
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

  def self.quantify(n)
    n == 1 ? 'a' : CARDINAL[n - 1]
  end
end
