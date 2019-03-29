class Clock
  def initialize(hour: 0, minute: 0)
    @minute = (minute + hour * 60) % DAY
  end

  def to_s
    "%02d:%02d" % to_hour_min
  end

  def +(clock)
    Clock.new(minute: minute + clock.minute)
  end

  def -(clock)
    Clock.new(minute: minute - clock.minute)
  end

  def ==(clock)
    minute == clock.minute
  end

  protected
  attr_reader :minute

  def to_hour_min
    [minute / 60, minute % 60]
  end

  private
  DAY = 24 * 60
end
