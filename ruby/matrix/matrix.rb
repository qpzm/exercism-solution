class Matrix
  def initialize(input)
    @input = input
  end

  def rows
    @rows ||= parse input
  end

  def columns
    @columns ||= rows.transpose
  end

  private

  attr_reader :input

  def parse(input)
    input.each_line.map { |n| n.split.map(&:to_i) }
  end
end
