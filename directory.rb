def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end

def print(students, name_starts_with)
  i = 0
#  while i < students.length do
  until i == students.length do
    if (students[i][:name].capitalize.start_with? name_starts_with) || (students[i][:name].length < 12)
      puts "#{i + 1} #{students[i][:name]} (#{students[i][:cohort]}) cohort with #{students[i][:hobbies]} hobbies from #{students[i][:country]} and with height of #{students[i][:height]}".center(100 ,"-")
    end
    i += 1
  end 
#  students.each_with_index do |student, idx|
#     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].capitalize.start_with? name_starts_with 
#     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].length < 12 
#  end
end

def print_footer(students) 
  puts "Overall, we have #{students.count()} great students"
end

def input_students
  students = []
  puts "Enter student details"
  puts "Press enter twice to finish"
  while true do
    puts "Enter student name"
    name = gets.chomp
    if name.empty?
      break
    end  
    puts "Enter student cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "not known cohort"
    end
    puts "Enter student hobbies"
    hobbies = gets.chomp
    if hobbies.empty?
      hobbies = "not known hobbies"
    end
    puts "Enter student country of birth"
    country = gets.chomp
    if country.empty?
      country = "not known country"
    end
    puts "Enter student height"
    height = gets.chomp
    if height.empty?
      height = "not known height"
    end
    students.push({name: name, cohort: cohort, hobbies: hobbies, country: country, height: height})
    puts "Now we have #{students.count} students"
  end
  return students
end

def obtain_name_start
    puts "Enter the starting letter of the names you want to print"
    first_alpha = gets.chomp.slice(0,1).upcase
    return first_alpha
end

students = input_students  
start_alphabet = obtain_name_start
print_header
print(students, start_alphabet)
print_footer(students)
