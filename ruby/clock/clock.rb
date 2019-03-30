class Clock
  def initialize(hour: 0, minute: 0)
    @minute = (minute + hour * 60) % MINUTES_IN_DAY
  end

  def to_s
     TIME_FORMAT % to_hour_min
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
    minute.divmod 60
  end

  private
  MINUTES_IN_DAY = 24 * 60
  TIME_FORMAT = "%02d:%02d"
end
