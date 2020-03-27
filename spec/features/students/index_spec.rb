require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I see a list of courses and the number of professors each student has at /students" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/students"

    within("#student-#{harry.id}") do
      expect(page).to have_content("#{harry.name}: #{harry.professors.length}")
    end

    within("#student-#{malfoy.id}") do
      expect(page).to have_content("#{malfoy.name}: #{malfoy.professors.length}")
    end

    within("#student-#{longbottom.id}") do
      expect(page).to have_content("#{longbottom.name}: #{longbottom.professors.length}")
    end

    expect(page.all('article')[0]).to have_content(malfoy.name)
    expect(page.all('article')[1]).to have_content(harry.name)
    expect(page.all('article')[2]).to have_content(longbottom.name)
  end
 end