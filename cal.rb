require 'optparse'
require 'date'
opt = OptionParser.new
params = {}
opt.on('-m') {|m| params[:m] = m }
opt.on('-y') {|y| params[:y] = y }

opt.parse!(ARGV)

month_of_argv = ARGV[0].to_i
year_of_argv = ARGV[1].to_i

if month_of_argv < 1 || month_of_argv > 12
  raise ArgumentError, "月は1-12の範囲を指定して下さい"
end

if year_of_argv < 1970 || year_of_argv > 2100
  raise ArgumentError, "年は1970-2100の範囲を指定して下さい"
end

month = params[:m] ? month_of_argv : Date.today.month
year = params[:y] ? year_of_argv : Date.today.year

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
