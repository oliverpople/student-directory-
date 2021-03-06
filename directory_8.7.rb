
  puts "Please enter the name and cohort of each student."
  puts "To finish, just the hit return twice"

def input_students
  students = []
  count = 0
  while students.count == count
    puts "What is the student's name?"
    name = gets.chomp
    puts "What is the student's cohort?"
    cohort = gets.chomp
    unless name.empty? && cohort.empty?
      name = "Default name" if name.empty?
      cohort = "Default date" if cohort.empty?
      students << {name: name.to_sym, cohort: cohort.to_sym}
      puts "Now we have #{students.count} students"
      count += 1
    else
      count -= 1
      print(students)
      puts "Would you like to make any changes to this list? Y/N?" # Opportunity to amend typos
      answer = gets.chomp.downcase
        if answer == "y"
          puts "Which student's details would you like to change?" +
          " Please spell name as written on list."
          name = gets.chomp
          students.delete_if {|x| x[:name] == name.to_sym}
          puts "'#{name}' has been deleted from the list." +
          " Please add the the correct details this time."
        else
        end
    end
  end
   students
end

def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
