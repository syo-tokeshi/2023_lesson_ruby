# frozen_string_literal: true

require 'debug'
require 'optparse'
require 'etc'

$params = ARGV.getopts('arl')

def dotmatch?
  $params["a"] ? File::FNM_DOTMATCH : 0 # aオプションがない場合は0を与えて隠しファイルを探さない
end

def permission_table(permission)
  {
    '0' => '---',
    '1' => 'x--',
    '2' => 'w--',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }[permission]
end

# p file = File.stat("ls2.rb")

file_list = ARGV[0] ? Dir.glob('*', dotmatch?, base: ARGV[0]) : Dir.glob('*', dotmatch?) # baseを指定すると、こちらを基準にファイルを探す
file_list.reverse! if $params["r"]
if $params["l"]
  stat_files = file_list.map{ |file| File.stat(file)}
  debugger
  puts stat_files
end
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
