class Frame
  def initialize(shots)
    @shots = shots # この時点で計算できる１個１個のshotが入っている
  end

  def total_scores
    @shots.sum # 自身が保有しているショットを計算するイメージ
  end
end
