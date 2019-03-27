class Clock
  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    "%02d:%02d" % [hour, minute]
  end

  def +(clock)
    Clock.new(hour: hour + clock.hour, minute: minute + clock.minute).to_s
  end

  def -(clock)
    Clock.new(hour: hour - clock.hour, minute: minute - clock.minute).to_s
  end

  def ==(clock)
    hour == clock.hour && minute == clock.minute
  end

  protected
  attr_reader :hour, :minute
end
