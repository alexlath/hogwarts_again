class ProfessorsController < ApplicationController
  def index
    professors = Professor.all
    @professors = professors.sort_by(&:name)
  end

  def show
    @professor = Professor.find(params[:id])
    @students_average_age = students_average_age(@professor.students)
  end

  private

  def students_average_age(students)
    sum = students.sum { |student| student.age }
    sum.fdiv(students.length)
  end
end