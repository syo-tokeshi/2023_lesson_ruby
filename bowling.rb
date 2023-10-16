scores = ARGV[0].split(",")
# p scores
calculable_scores = scores.map{ |score|
  if score == "X"
    [10,0]
  else
    score
  end
}.flatten.map(&:to_i)
# p calculable_scores

framed_scores = calculable_scores.each_slice(2).to_a
p framed_scores

total_score = 0
framed_scores.each_with_index { |frame, index|
  total_score += frame.sum
  # binding.irb
  if index < 9
    if frame[0] == 10
      total_score += framed_scores[index + 1].sum
      total_score += framed_scores[index + 2].first if framed_scores[index + 1].first == 10 # 次のスコアがストライクの場合、次のスコアの最初の値のみを入れる
    elsif frame.sum == 10
      total_score += framed_scores[index + 1].first
    end
  end
}
p total_score
