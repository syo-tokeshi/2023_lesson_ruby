# f = File.open("./test_dir/a", "r")
stdin = $stdin.readlines
stdin
# p files = stdin.split("\n")
files_without_new_line = stdin.map{ |file|
  file.delete("\n")
}
p files_without_new_line
