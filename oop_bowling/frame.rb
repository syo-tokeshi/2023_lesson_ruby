require 'shot'
class Frame
  def initialize(shots)
    @shots = []
    shots.each { |s|
      @shots += Shot.new(s) # フレームクラスが呼ばれる時、配列で渡ってくるので、eachで回してnew
    }
  end

  def total_scores
    @shots.sum # 自身が保有しているショットを計算するイメージ
  end
end
