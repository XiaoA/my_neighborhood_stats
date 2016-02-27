module Features
  def sign_in_with_valid_credentials
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: "sherlock@example.com"
    fill_in "Password", with: "e1m3taRY!#MyD3arWa2*"
    click_on "Sign In"
  end

  def sign_in_with_invalid_credentials
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: nil
    fill_in "Password", with: "e1m3t!#MyD3arWa2*"
    click_on "Sign In"
  end



  def add_new_location
    click_on "New Location"
    fill_in "Address", with: "999 Anywhere St"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "WA"
    fill_in "Zip code", with: "98101"

    click_on "Create Location"
  end
  
end
