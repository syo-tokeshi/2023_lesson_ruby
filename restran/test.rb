require_relative '' 'menu'
require 'minitest/autorun'

class MenuTest < Minitest::Test
  def test_min_onigiri_price
    menu1 = Menu.new("onigiri", 200)
    assert_operator menu1.get_total_price(3), :>=, 500
  end

  def test_min_yakiniku_price
    menu4 = Menu.new("yakiniku-teisyoku", 3000)
    assert_operator menu4.get_total_price(10), :>=, 27000
  end

  def test_max_yakiniku_price
    menu4 = Menu.new("yakiniku-teisyoku", 3000)
    assert_operator menu4.get_total_price(10), :<=, 28000
  end
end
