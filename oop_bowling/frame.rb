class Frame
  def initialize(shots)
    @shots = shots
  end

  def total_scores
    @shots.sum # ショットを計算するイメージ
  end
end
