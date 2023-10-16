# frozen_string_literal: true

scores = ARGV[0].split(',')

calculable_scores = scores.map do |score|
  if score == 'X'
    [10, 0]
  else
    score
  end
end.flatten.map(&:to_i)

framed_scores = calculable_scores.each_slice(2).to_a

total_score = 0
framed_scores.each_with_index do |frame, index|
  total_score += frame.sum

  if index < 9 # 最終フレームだけは最初のみ計算するので除外する
    if frame[0] == 10 # ストライクの場合
      total_score += framed_scores[index + 1].sum # 次のフレームの合計を足す
      total_score += framed_scores[index + 2][0] if framed_scores[index + 1][0] == 10 # 次のスコアがストライクの場合、次の次のスコアの最初の値のみを入れる
    elsif frame.sum == 10 # スペアの場合
      total_score += framed_scores[index + 1][0]
    end
  end
end
p total_score
