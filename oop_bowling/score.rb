# frozen_string_literal: true

class Score
  attr_reader :scores

  def initialize(score)
    @scores = convert_to_computable_scores(score) # 文字列として渡ってきたスコアを計算可能な配列のスコアにして格納する
  end

  private

  def convert_to_computable_scores(score)
    scores = score.split(',')
    scores.map do |s|
      if s == 'X'
        [10, 0]
      else
        s.to_i
      end
    end.flatten
  end
end
