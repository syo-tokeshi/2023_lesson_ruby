class Score
  attr_reader :scores
  def initialize(score)
    @scores = convert_score_to_scores(score)
  end

  def convert_score_to_scores(score)
    scores = score.split(',')
    scores.map do |s|
      if s == 'X'
        [10,0]
      else
        s.to_i
      end
    end.flatten
  end


end
