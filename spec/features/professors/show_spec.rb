require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I see a list of students of the professor at /professors/:id" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry, professor_id: snape)
    ProfessorStudent.create(student_id: longbottom, professor_id: snape)

    visit "/professors/#{snape.id}"

    within("#students") do
      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.name)
    end
  end
end