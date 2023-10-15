require 'optparse'
require 'date'
opt = OptionParser.new
params = {}
opt.on('-m') {|m| params[:m] = m }
opt.on('-y') {|y| params[:y] = y }

opt.parse!(ARGV)

month = params[:m] ? ARGV[0].to_i : Date.today.month
year = params[:y] ? ARGV[1].to_i : Date.today.year

month_first_date = Date.new(year, month, 1)
month_last_date = Date.new(year, month, -1)

puts "       #{month}月 #{year}"
puts " 日 月 火 水 木 金 土  "

(month_first_date..month_last_date).each { |date|
  if date.saturday?
    puts date.day.to_s.rjust(3, " ")
  else
    print date.day.to_s.rjust(3, " ")
  end
}
