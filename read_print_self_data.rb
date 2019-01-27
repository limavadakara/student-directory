filename = __FILE__
File.open(filename, "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end
# using filename = $PROGRAM_NAME or $0 will also give the same result

