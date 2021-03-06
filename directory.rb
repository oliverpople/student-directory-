

# let's put all students into an interactive array
def input_students
  puts "Please enter the names of the students followed by their favourite hobby,"
  + " country of birth and height(cm). Please seperate each by a comma."
  puts "To finish, just the hit return twice"
  #create an empty array
  students = []
  # get the first name + personal details from user
  name, hobby, country, height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name + personal from the user
    name, hobby, country, height = gets.chomp
  end
  # return the array of students + personal details
  students
end

# and then print them
def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print(students)
  count = 1
  while count <= students.length
    student = students[count - 1]
    puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
