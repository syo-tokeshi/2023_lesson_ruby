# frozen_string_literal: true

require_relative 'game'
require 'minitest/autorun'

class BowlingTest < Minitest::Test
  def test_calc_1
    assert_equal 139, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5').total_point
  end

  def test_calc_2
    assert_equal 164, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X').total_point
  end

  def test_calc_3
    assert_equal 107, Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4').total_point
  end

  def test_calc_3
    assert_equal 134, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0').total_point
  end

  def test_calc_4
    assert_equal 144, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,1,8').total_point
  end

  def test_calc_5
    assert_equal 50, Game.new('X,0,0,X,0,0,X,0,0,X,0,0,X,0,0').total_point
  end

  def test_calc_all_zero
    assert_equal 0, Game.new('0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0').total_point
  end

  def test_calc_perfect
    assert_equal 300, Game.new('X,X,X,X,X,X,X,X,X,X,X,X').total_point
  end
end
