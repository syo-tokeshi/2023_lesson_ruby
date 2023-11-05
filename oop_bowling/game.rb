require 'frame'
require 'score'
class Game
  def initialize(score)
    @scores = Score.new(score) # scoreの中身は何かあまり気にせず、newすると良い感じに変換されているイメージを持つ
    @frames = []
  end

  def total_scores
    @scores.each_slice(2) do |s|
      @frames += Frame.new(s) # ボウリングのフレームは１投目&2投目のペアなのは明確なので、この渡し方で良さそう
    end
    @frames.sum # gameが保有しているブウリングの各フレームを全部足すイメージ
  end
end
