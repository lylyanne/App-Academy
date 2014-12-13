class Student
  attr_reader :first, :last
  attr_accessor :course_arr

  def initialize(first, last)
    @first = first
    @last = last
    @course_arr = []
  end

  def name
    first + " " + last
  end

  #def courses
  #end

  def enroll(course) #course = Course.new("math", "comp sci", 5)
    if !course_arr.include?(course)
      # doesn't this modify @course_arr??
      self.course_arr << course
      course.add_student(name)
    end
  end

  def course_load
  end

end

class Course
  attr_accessor :students

  def initialize(course_name, dept, credit)
    @course_name, @dept, @credit = course_name, dept, credit
    @students = []
  end

  #def students
  #  @students
  #end

  def add_student(name)
    self.students << name
  end
end

math = Course.new("math", "comp sci", 5)
english = Course.new("english", "lit", 3)
adam = Student.new("adam", "berkovec")
felicia = Student.new("felicia", "wang")
felicia.enroll(math)
p felicia.course_arr
p math.students
p english.students
p
