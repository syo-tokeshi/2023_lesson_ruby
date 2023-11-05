require 'frame'
class Game
  def initialize(scores)
    @frames = Frame.new(scores) # scoresの中身は何かあまり気にせず、newすると良い感じに変換されているイメージを持つ
  end

  def total_scores
    @frames.sum # gameが保有しているブウリングの各フレームを全部足すイメージ
  end
end
