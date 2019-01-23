def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end

def print(students, name_starts_with)
  students.each_with_index do |student, idx|
     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].capitalize.start_with? name_starts_with 
     puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].length < 12 
  end
end

def print_footer(students) 
  puts "Overall, we have #{students.count()} great students"
end

def input_students
  students = []
  puts "Enter names of students"
  puts "Press enter twice to finish"
  while true do
    name = gets.chomp
    if name.empty?
      break
    end  
    students.push({name: name, cohort: :november})
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
