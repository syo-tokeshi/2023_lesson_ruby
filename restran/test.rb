require_relative '' 'menu'
require 'minitest/autorun'

class MenuTest < Minitest::Test

  def setup
    menu1 = Menu.new("onigiri", 200)
    menu4 = Menu.new("yakiniku-teisyoku", 3000)
  end

  def test_min_onigiri_price
    assert_operator menu1.get_total_price(3), :>=, 500
  end

  def test_min_yakiniku_price
    assert_operator menu4.get_total_price(10), :>=, 27000 # これより安いと儲けが少ない
  end

  def test_max_yakiniku_price
    assert_operator menu4.get_total_price(10), :<=, 28000 # これを上回ると高いのでお得じゃない
  end
end
