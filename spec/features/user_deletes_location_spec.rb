require 'rails_helper'

feature "User deletes location" do
  scenario "successfully" do

    create_user_valid_credentials
    create_location   
    delete_location

    expect(page).to have_content("Location has been deleted.")
  end
end
