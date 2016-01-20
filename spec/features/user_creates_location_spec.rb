require 'rails_helper'

feature "User creates location" do
  scenario "successfully" do
    visit root_path
    click_on "New Location"
    fill_in "Address", with: "999 Anywhere St"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "WA"
    fill_in "Zip code", with: "98101"

    click_on "Create Location"
    expect(page).to have_css "#notice", text: "Location was successfully created."
  end
end
