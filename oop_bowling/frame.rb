# frozen_string_literal: true

class Frame
  attr_reader :shots

  def initialize(shots)
    @shots = shots # shotのペアが入っている
  end

  def total_shots
    @shots.sum # shotのペアの合計値を出す
  end
end
