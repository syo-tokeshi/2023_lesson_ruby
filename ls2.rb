# frozen_string_literal: true

require 'debug'
require 'optparse'
$params = ARGV.getopts('ar')

def dotmatch?
  $params["a"] ? File::FNM_DOTMATCH : 0 # aオプションがない場合は0を与えて隠しファイルを探さない
end

p file = File.stat("ls2.rb")

file_list = ARGV[0] ? Dir.glob('*', dotmatch?, base: ARGV[0]) : Dir.glob('*', dotmatch?) # baseを指定すると、こちらを基準にファイルを探す
file_list.reverse! if $params["r"]
file_count = file_list.count
max_filename_length = file_list.max_by(&:length).length
whitespace = 3
displayed_column_count = 3
column_count = (file_count / displayed_column_count.to_f).ceil # ceilで切り上げるためには、to_fで小数点を付ける必要がある

displayed_file_list = file_list.each_slice(column_count).to_a
shortage_file_count = column_count - displayed_file_list[-1].count # グループ化する際に余りが出たら個数を数える
displayed_file_list[-1].push(*Array.new(shortage_file_count, '')) # 後にtransposeでグループの個数を合わせるために、穴埋めファイルを作る
transposed_file_list = displayed_file_list.transpose

transposed_file_list.each do |files|
  puts files.map { |file|
    file.ljust(max_filename_length + whitespace, ' ')
  }.join
end
