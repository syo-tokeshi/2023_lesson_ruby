# frozen_string_literal: true

require 'debug'
file_list = Dir.glob('*')
max_filename_length = file_list.max_by(&:length).length
whitespace = 5
group_count = 3

grouped_files = file_list.each_slice(group_count).to_a
shortage_file_count = group_count - grouped_files[-1].count # グループ化する際に余りが出たら個数を数える
grouped_files[-1].push(*Array.new(shortage_file_count, '')) # 後にtransposeでグループの個数を合わせるために、穴埋めファイルを作る
displayed_file_group = grouped_files.transpose

displayed_file_group.each do |group|
  puts group.map { |file|
    file.ljust(max_filename_length + whitespace, ' ')
  }.join
end
