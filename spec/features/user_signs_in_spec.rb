require 'rails_helper'

RSpec.feature "Signing in" do
  let!(:user) { Fabricate(:user, email: 'sherlock@example.com', password: 'e1m3taRY!#MyD3arWa2*', password_confirmation: 'e1m3taRY!#MyD3arWa2*') }
  
  scenario "with valid credentials" do
    sign_in_with_valid_credentials

    expect(page).to have_content("You have successfully logged in.")
  end

  scenario "with invalid credentials" do
    sign_in_with_invalid_credentials

    expect(page).to have_content("There was something wrong with your login information.")
  end
end
