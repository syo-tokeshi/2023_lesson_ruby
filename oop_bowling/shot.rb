class Shot
  attr_reader :mark
  def initialize(mark)
    # @mark = mark # ボウリングの各ピンを表す記号(文字列)が渡ってくる
    @mark = mark
  end

  # def convert_mark_to_pin(mark)
  #   mark == 'X' ?
  # end
end
