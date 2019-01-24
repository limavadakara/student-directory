@students = []
def interactive_menu
  loop do
    print_menu
    process_choice(gets.chomp)
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input students"
  puts "2. Print students"
  puts "9. Exit"
end 

def process_choice(choice)
  case choice
    when "1"
      input_students()
    when "2"
      print_header
      print(obtain_name_start())
      print_footer()
    when "9"
      exit
    else
      puts "Invalid selection, please try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end

def print(name_starts_with)
  i = 0
#  while i < @students.length do
  until i == @students.length do
    if (@students[i][:name].capitalize.start_with? name_starts_with) || (@students[i][:name].length < 12)
      puts "#{i + 1} #{@students[i][:name]} (#{@students[i][:cohort]}) cohort with #{@students[i][:hobbies]} hobbies from #{@students[i][:country]} and with height of #{@students[i][:height]}".center(100 ,"-")
    end
    i += 1
  end 
#  @students.each_with_index do |student, idx|
#     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].capitalize.start_with? name_starts_with 
#     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].length < 12 
#  end
end

def print_footer()
  puts @students.count == 1 ? "Overall, we have #{@students.count()} great student" : "Overall, we have #{@students.count()} great students"
end

def input_students()
  puts "Enter student details"
  puts "Press enter twice to finish"
  while true do
    puts "Enter student name"
    name = gets.chomp
    if name.empty?
      break
    end  
    puts "Enter student cohort"
    cohort = gets.gsub(/\n/, "")
    if cohort.empty?
      cohort = "not known cohort"
    end
    puts "Enter student hobbies"
    hobbies = gets.gsub("\n", "")
    if hobbies.empty?
      hobbies = "not known hobbies"
    end
    puts "Enter student country of birth"
    country = gets.delete("\n")
    if country.empty?
      country = "not known country"
    end
    puts "Enter student height"
    height = gets.tr("\n", "")
    if height.empty?
      height = "not known height"
    end
    @students.push({name: name, cohort: cohort, hobbies: hobbies, country: country, height: height})

    puts @students.count == 1? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
  end
  return @students
end

def obtain_name_start
    puts "Enter the starting letter of the names you want to print"
    first_alpha = gets.chomp.slice(0,1).upcase
    return first_alpha
end

def print_students_grouped_by_cohort()
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

interactive_menu
