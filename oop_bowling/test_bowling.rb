# frozen_string_literal: true
require_relative 'game'
require 'minitest/autorun'

# score = ARGV[0] # ボウリングのスコアは"6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4"のような文字列で渡ってくる。
# game = Game.new(score) # 上記の文字列をGameクラスにサクッと渡しても良い感じにする(gameクラスに何を渡すべきか細かく知る必要はない)
# p game.total_scores()

class BowlingTest < Minitest::Test
  def test_calc_1
    assert_equal 139, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5').total_scores()
  end

  def test_calc_2
    assert_equal 164, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X').total_scores()
  end

  def test_calc_3
    assert_equal 107, Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4').total_scores()
  end

  def test_calc_3
    assert_equal 134, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0').total_scores()
  end

  def test_calc_4
    assert_equal 144, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,1,8').total_scores()
  end

  def test_calc_5
    assert_equal 50, Game.new('X,0,0,X,0,0,X,0,0,X,0,0,X,0,0').total_scores()
  end

  def test_calc_all_zero
    assert_equal 0, Game.new('0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0').total_scores()
  end

  def test_calc_perfect
    assert_equal 300, Game.new('X,X,X,X,X,X,X,X,X,X,X,X').total_scores()
  end
end
