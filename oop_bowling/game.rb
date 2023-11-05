require_relative 'frame'
require_relative 'score'
require 'debug'

class Game
  def initialize(score)
    score = Score.new(score) # scoreの中身は何かあまり気にせず、newすると良い感じに変換されているイメージを持つ
    @frames = score.scores.each_slice(2).map do |s|
      Frame.new(s) # ボウリングのフレームは１投目&2投目のペアなのは明確なので、この渡し方で良さそう
    end
  end

  def total_scores
    total_point = 0
    @frames.each_with_index do |frame, index|
      total_point += frame.total_scores

      if index < 9 # 最終フレームだけは最初のみ計算するので除外する
        # debugger
        if frame.shots[0] == 10 # ストライクの場合
          total_point += @frames[index + 1].total_scores # 次のフレームの合計を足す
          total_point += @frames[index + 2].shots[0] if @frames[index + 1].shots[0] == 10
        elsif frame.total_scores == 10 # スペアの場合
          total_point += @frames[index + 1].shots[0]
        end
      end
    end
    total_point
  end
end
