class StudentsController < ApplicationController
  def index
    students = Student.all
    @students = students.sort_by(&:name)
  end
end