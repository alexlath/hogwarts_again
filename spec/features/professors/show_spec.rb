require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 12 , house: "Gryffindor" )

    ProfessorStudent.create(student: @harry, professor: @snape)
    ProfessorStudent.create(student: @longbottom, professor: @snape)

    visit "/professors/#{@snape.id}"

    @average
  end

  it "I see a list of students of the professor at /professors/:id" do
    within('#students') do
      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@longbottom.name)
    end
  end

  it "I can see the average age of all students for the professor at /professors/:id" do
    average_age = (@harry.age + @longbottom.age).fdiv(@snape.students.length)

    within('#students-info') do
      expect(page).to have_content("Average Age: #{average_age}")
    end
  end
end