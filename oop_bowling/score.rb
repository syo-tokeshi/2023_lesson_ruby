class Score
  def initialize(score)
    @score = score
  end

  def convert_score_to_scores
    @score.split(',')
  end
end
