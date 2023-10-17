# frozen_string_literal: true

require 'debug'
file_list = Dir.glob('*')
file_count = file_list.count
max_filename_length = file_list.max_by(&:length).length
whitespace = 3
displayed_column_count = 2
column_count = (file_count / displayed_column_count.to_f).ceil

displayed_file_list = file_list.each_slice(column_count).to_a
shortage_file_count = column_count - displayed_file_list[-1].count # グループ化する際に余りが出たら個数を数える
displayed_file_list[-1].push(*Array.new(shortage_file_count, '')) # 後にtransposeでグループの個数を合わせるために、穴埋めファイルを作る
transposed_file_list = displayed_file_list.transpose

transposed_file_list.each do |files|
  puts files.map { |file|
    file.ljust(max_filename_length + whitespace, ' ')
  }.join
end
