require_relative 'menu'

menus = [
  menu1 = Menu.new("gyu-don", 500),
  menu2 = Menu.new("onigiri", 200),
  menu3 = Menu.new("dinner", 3000),
  menu4 = Menu.new("lunch", 2000)
]

puts "番号を入力し、商品を選んで下さい"

menus.each_with_index { |menu, index|
  puts "#{index + 1}、#{menu.info}"
}

selected_menu_number = gets.chomp.to_i

puts "あなたが選んだのは#{selected_menu_number}、#{menus[selected_menu_number - 1].name}ですね"

puts "いくつ欲しいですか？"

want_count = gets.chomp.to_i

puts "#{menus[selected_menu_number - 1].name}の合計金額は#{menus[selected_menu_number - 1].get_total_price(want_count)}円になります！"
puts "お疲れ様です！"
