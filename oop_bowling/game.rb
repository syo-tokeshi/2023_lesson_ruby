require_relative 'frame'
require_relative 'score'
class Game
  def initialize(score)
    @scores = Score.new(score) # scoreの中身は何かあまり気にせず、newすると良い感じに変換されているイメージを持つ
    @frames = []
    @scores.each_slice(2) do |s|
      @frames += Frame.new(s) # ボウリングのフレームは１投目&2投目のペアなのは明確なので、この渡し方で良さそう
    end
  end

  def total_scores
    total_point = 0
    @frames.each_with_index do |frame, index|
      total_point += frame.total_scores

      if index < 9 # 最終フレームだけは最初のみ計算するので除外する
        if frame[0] == 10 # ストライクの場合
          total_point += @frames[index + 1].total_scores # 次のフレームの合計を足す
          total_point += @frames[index + 2][0] if @frames[index + 1][0] == 10
        elsif frame.total_scores == 10 # スペアの場合
          total_point += @frames[index + 1][0]
        end
      end
    end
    total_point
  end
end
