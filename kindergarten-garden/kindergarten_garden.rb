class Garden

  CROPS = {
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass,
    "V" => :violets
  }

  attr_reader :rows, :students

  STUDENT_OFFSET = 2
  STUDENT_PLANTER_ROW_COUNT = 2

  def initialize(garden, students=default_students)
    @rows = garden.lines(chomp: true).map(&:chars)
    @students = students.sort.map(&:downcase).map(&:to_sym)  
  end

  def method_missing(method_name)
    student = method_name
    super unless students.include?(student)
    planters_from_column start_column_for(student) 
  end

  private

  def start_column_for(student)
    students.index(student) * STUDENT_OFFSET
  end
  
  def planters_from_column(start_column)
    rows.map do |row|
      row[start_column, STUDENT_PLANTER_ROW_COUNT].map(&CROPS)
    end.flatten
  end

  
  def default_students
    %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]
  end
end