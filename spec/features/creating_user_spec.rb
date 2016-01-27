require 'rails_helper'

RSpec.feature "Creating users" do
  scenario "with valid credentials" do
    create_user_valid_credentials

    expect(page).to have_content('User has been created.')
  end

    scenario "with invalid credentials" do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First name', with: nil
    fill_in 'Last name', with: nil
    fill_in 'Email', with: 'whatever'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Create User'

    expect(page).to have_content('User has not been created.')
  end
end
