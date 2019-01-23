def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end

def print(students)
  students.each_with_index do |student, idx|
    puts "#{idx+1} #{student[:name]} (#{student[:cohort]}) cohort" if student[:name].capitalize.start_with? "A" 
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

students = input_students  
print_header
print(students)
print_footer(students)
