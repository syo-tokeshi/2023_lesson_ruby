# frozen_string_literal: true

class Frame
  attr_reader :shots

  def initialize(shots)
    @shots = shots # この時点で計算できる１個１個のshotが入っている
  end

  def total_shots
    @shots.sum # 自身が保有しているショットを計算するイメージ
  end
end
