# binding.irb
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
framed_scores.each.with_index(1) { |frame, index|
  # binding.irb
  total_score += frame.sum
  if index < 9
    if frame[0] == 10
      total_score += framed_scores[index + 1].sum
      total_score += 10 if framed_scores[index + 1] == 10
    elsif frame.sum == 10
      total_score += framed_scores[index + 1].first
    end
  end
}
p total_score
