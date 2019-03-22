class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if str.length < n
    str.scan(/(?=(\w{#{n}}))/).flatten
  end

  private

  attr_reader :str
end
