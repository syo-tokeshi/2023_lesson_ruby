require_relative 'menu'

menus = [
  menu1 = Menu.new("onigiri", 200),
  menu2 = Menu.new("gyu-don", 500),
  menu3 = Menu.new("makunouchi-gozen", 2000),
  menu4 = Menu.new("yakiniku-teisyoku", 3000)
]

puts "番号を入力し、商品を選んで下さい"

menus.each_with_index { |menu, index|
  puts "#{index + 1}、#{menu.info}"
}

while true
  selected_menu_number = gets.chomp.to_i
  break if (1..menus.length).cover?(selected_menu_number)
  puts "1 ~ #{menus.length}の中から選んでください"
end

puts "あなたが選んだのは#{selected_menu_number}、#{menus[selected_menu_number - 1].name}ですね"

puts "いくつ欲しいですか？(1 ~ 10内の数字でお願いします。)"

while true
  want_count = gets.chomp.to_i
  break if (1..10).cover?(want_count)
  puts "1 ~ 10の数を指定してください"
end

if want_count >= 3
  puts "3個以上買ってくれたので割引しておきました！"
end

puts "#{menus[selected_menu_number - 1].name}の合計金額は#{menus[selected_menu_number - 1].get_total_price(want_count)}円になります！"
puts "お疲れ様です！"
