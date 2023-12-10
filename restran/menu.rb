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
    price * count
  end
end
