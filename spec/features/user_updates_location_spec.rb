require 'rails_helper'

feature "User updates location" do
  scenario "successfully" do

    create_user_valid_credentials
    create_location
    update_location

    expect(page).to have_content("Location was successfully updated.")
  end
end
