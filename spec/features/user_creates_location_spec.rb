require 'rails_helper'

feature "User creates location" do
  scenario "successfully" do
    create_user_valid_credentials
    create_location   
    
    expect(page).to have_content("Location was successfully created.")
    expect(page).to have_content("Seattle, WA 98101")
    expect(page).to have_content("Neighborhood Demographics").and have_link("Neighborhood Data")
    expect(page).to have_content("School District Information").and have_link("Search Schools")
    expect(page).to have_content("Find your new favorite hangout").and have_link("Yelp")
    
  end

  scenario "unsuccessfully" do
    create_user_valid_credentials
    create_invalid_location

    expect(page).to have_content("Location has not been created.")
  end
end
