@students = []


def interactive_menu
  loop do
    print_menu
    process_choice(STDIN.gets.chomp)
  end
end


def print_menu
  puts "What would you like to do?"
  puts "1. Input students"
  puts "2. Print students"
  puts "3. Save student list to students.csv"
  puts "4. Load student list from students.csv"
  puts "5. Print students starting with a particular Letter"
  puts "6. Print students by cohort" 
  puts "9. Exit"
end 


def process_choice(choice)
  case choice
    when "1"
      input_students()
    when "2"
      show_students()
    when "3"
      save_students()
    when "4"
      load_students()
    when "5"
      print_students_name_starting_with()
    when "6"
      print_students_grouped_by_cohort()
    when "9"
      exit
    else
      puts "Invalid selection, please try again"
  end
end


def show_students
  if @students.empty?
    puts "No students loaded. Load students before printing"
    return
  end
  print_header
  print_students_list()
  print_footer()
end


def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end


def print_students_list()
  i = 0
  until i == @students.length do
      puts "#{i + 1} #{@students[i][:name]} (#{@students[i][:cohort]}) cohort with #{@students[i][:hobbies]} hobbies from #{@students[i][:country]} and with height of #{@students[i][:height]}".center(100 ,"-")
    i += 1
  end 
end


def print_students_name_starting_with()
  if @students.empty?
    puts "No students loaded. Load students before printing"
    return
  end
  name_starts_with = obtain_name_start()
  count = 0  
  @students.each_with_index do |student, idx|
     if student[:name].capitalize.start_with? name_starts_with
       puts "#{idx + 1} #{student[:name]} (#{student[:cohort]}) cohort with #{student[:hobbies]} hobbies from #{student[:country]} and with height of #{student[:height]}".center(100 ,"-")
       count += 1
     end
  end
  puts "No students who have name starting with #{name_starts_with}" if count == 0
end


def print_footer()
  puts @students.count == 1 ? "Overall, we have #{@students.count()} great student" : "Overall, we have #{@students.count()} great students"
end


def input_students()
  puts "Enter student details"
  puts "Press enter twice to finish"
  while true do
    puts "Enter student name"
    name = STDIN.gets.chomp
    if name.empty?
      break
    end  
    puts "Enter student cohort"
    cohort = STDIN.gets.gsub(/\n/, "")
    if cohort.empty?
      cohort = "unknown"
    end
    puts "Enter student hobbies"
    hobbies = STDIN.gets.gsub("\n", "")
    if hobbies.empty?
      hobbies = "unknown"
    end
    puts "Enter student country of birth"
    country = STDIN.gets.delete("\n")
    if country.empty?
      country = "unknown"
    end
    puts "Enter student height"
    height = STDIN.gets.tr("\n", "")
    if height.empty?
      height = "unknown"
    end
    @students.push({name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height})

    puts @students.count == 1? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
  end
end


def obtain_name_start
  puts "Enter the starting letter of the names you want to print"
  first_alpha = STDIN.gets.chomp.slice(0,1).upcase
  return first_alpha
end


def print_students_grouped_by_cohort()
  if @students.empty?
    puts "No students loaded. Load students before printing"
    return
  end
  cohorts_grouping = Hash.new
  @students.map { |student|
    cohort = student[:cohort]
    name = student[:name]
    if cohorts_grouping[cohort.to_sym] == nil
      cohorts_grouping[cohort.to_sym] = [name]
    else
      cohorts_grouping[cohort.to_sym].push(name)
    end
  }
  cohorts_grouping.each do |key, value|
        puts "Cohort #{key} has #{value.join(", ")}"
  end
end


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_info = [student[:name], student[:cohort],student[:hobbies], student[:country], student[:height]]
    file.puts student_info.join(",")
  end
  file.close()
end


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobbies, country, height = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height}
  end
  file.close()  
end


def try_file_load
  filename = ARGV.first
  if filename.nil? 
     return
  end
  if File.exist?(filename)
    load_students(filename)
    puts "#{@students.count} students loaded from file #{filename}"
  else
    puts "#{filename} does not exist so couldn't be loaded"
  end
end


try_file_load
interactive_menu
