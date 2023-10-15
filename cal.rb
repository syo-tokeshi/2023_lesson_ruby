require 'optparse'
require 'date'
opt = OptionParser.new
params = ARGV.getopts('m:y:')

month = (params["m"] || Date.today.month).to_i
year = (params["y"] || Date.today.year).to_i

if month < 1 || month > 12
  raise ArgumentError, "月は1-12の範囲を指定して下さい"
end

if year < 1970 || year > 2100
  raise ArgumentError, "年は1970-2100の範囲を指定して下さい"
end

month_first_date = Date.new(year, month, 1)
month_last_date = Date.new(year, month, -1)

puts "       #{month}月 #{year}"
puts " 日 月 火 水 木 金 土  "
print "   " * month_first_date.wday # 曜日によって余白を設ける

def show_day(date)
  date.day.to_s.rjust(3, " ")
end

(month_first_date..month_last_date).each { |date|
  if date.saturday?
    puts show_day(date)
  else
    print show_day(date)
  end
}
