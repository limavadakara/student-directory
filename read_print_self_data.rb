filename = $0
File.open(filename, "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end
# using filename = $PROGRAM_NAME will also give the same result

