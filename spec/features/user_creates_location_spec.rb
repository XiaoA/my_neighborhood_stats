require 'rails_helper'

feature "User creates location" do
  scenario "successfully" do
    visit 'locations#new'
    click_on "New Location"
    fill_in "Address", with: "999 Anywhere St"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "WA"
    fill_in "Zip code", with: "98101"

    click_on "Submit"
    expect(page).to have_css "#notice", text: "Location was successfully created."
    expect(page).to have_content("Seattle, WA 98101")

    expect(page).to have_content("Neighborhood Demographics").and have_link("Neighborhood Data")

    expect(page).to have_content("School District Information").and have_link("Search Schools")
    expect(page).to have_content("Find your new favorite hangout").and have_link("Yelp")
    expect(page).to have_content("Meet your neighbors").and have_link("Nextdoor.com")

  end
end
