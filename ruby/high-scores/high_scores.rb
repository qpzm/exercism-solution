class HighScores
  attr_reader :scores

  def initialize(scores = [])
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    personal_top.first
  end

  def personal_top
    top3
  end

  def report
    "Your latest score was #{latest}. " + report_detail
  end

  private

  def top3
    @top3 ||= scores.max(3)
  end

  def report_detail
    diff = personal_best - latest
    if diff.zero?
      "That's your personal best!"
    else
      "That's #{diff} short of your personal best!"
    end
  end
end
