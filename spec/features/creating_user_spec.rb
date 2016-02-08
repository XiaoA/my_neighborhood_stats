require 'rails_helper'

RSpec.feature "Creating users" do
  scenario "with valid credentials" do
    create_user_valid_credentials

    expect(page).to have_content('User has been created.')
  end

    scenario "with invalid credentials" do
      create_user_invalid_credentials
      expect(page).to have_content('User has not been created.')
  end
end
