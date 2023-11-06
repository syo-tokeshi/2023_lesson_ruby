# frozen_string_literal: true

class Score
  attr_reader :scores

  def initialize(score)
    @scores = convert_score_to_scores(score)
  end

  private

  def convert_score_to_scores(score)
    scores = score.split(',')
    convert_to_computable_scores(scores)
  end

  def convert_to_computable_scores(scores)
    scores.map do |s|
      if s == 'X'
        [10, 0]
      else
        s.to_i
      end
    end.flatten
  end
end
