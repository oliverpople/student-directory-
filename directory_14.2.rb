@students = [] # an empty variable for all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # '9' beacuse we'll be adding more.
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    students_array(name, "November")
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # opne the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # tries first argument from command line
  filename ||= "students.csv"  # ruby "||="
  #if filename.to_s.empty?
  #  return load_students
  #end
  if File.exist?(filename.to_s) # if it exists
    load_students(filename)
      puts "Loaded" #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv") # "students.csv"becomes default value,
  # if no other argument is given to load_students.
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',') # parrallel assignment; assigninig two varibales at same time
    students_array(name, cohort)
  end
  file.close
end

def students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
