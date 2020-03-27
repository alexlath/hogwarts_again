require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I see a list of professors and their info when I visit /professors" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit "/professors"

    within("#professor-#{snape.id}") do
      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end

    within("#professor-#{hagarid.id}") do
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(hagarid.specialty)
    end

    within("#professor-#{lupin.id}") do
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(luipin.age)
      expect(page).to have_content(luipin.specialty)
    end
  end
end
