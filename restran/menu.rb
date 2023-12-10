require 'debug'
class Menu
  attr_reader :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end

  def info
    "この商品は#{name}で#{price}円です"
  end

  def get_total_price(count)
    if count >= 3
      return discounted_total_price(count)
    end
    price * count
  end

  private

  def discounted_total_price(count)
    (price * count) - discount_by_rate
  end

  def discount_by_rate
    # debugger
    case price
    when price >= 1000
      200
    else
      100
    end
  end

end
