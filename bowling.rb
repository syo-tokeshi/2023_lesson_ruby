# frozen_string_literal: true

def main(argv)
  scores = argv.split(',')

  calculable_scores = scores.map do |score|
    if score == 'X'
      [10, 0]
    else
      score
    end
  end.flatten.map(&:to_i)

  framed_scores = calculable_scores.each_slice(2).to_a

  total_point = 0
  framed_scores.each_with_index do |frame, index|
    total_point += frame.sum

    if index < 9 # 最終フレームだけは最初のみ計算するので除外する
      if frame[0] == 10 # ストライクの場合
        total_point += framed_scores[index + 1].sum # 次のフレームの合計を足す
        total_point += framed_scores[index + 2][0] if framed_scores[index + 1][0] == 10
      elsif frame.sum == 10 # スペアの場合
        total_point += framed_scores[index + 1][0]
      end
    end
  end
  total_point
end

if __FILE__ == $PROGRAM_NAME # rubocop:disable Style/IfUnlessModifier
  puts main(ARGV[0])
end
