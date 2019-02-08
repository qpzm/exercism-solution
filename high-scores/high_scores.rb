class HighScores
  attr_accessor :scores

  def initialize(scores = [])
    @scores = scores
    @descending = nil
  end

  def latest
    @scores.last
  end

  def personal_best
    descending!
    @descending.first
  end

  def personal_top
    descending!
    @descending.first(3)
  end

  def report
    latest_score = latest
    best_score = personal_best

    "Your latest score was #{latest_score}. " +
      if latest_score == best_score
        "That's your personal best!"
      else
        "That's #{best_score - latest_score} short of your personal best!"
      end
  end

  private

  def descending!
    @descending ||= @scores.sort { |x, y| y <=> x }
  end
end
