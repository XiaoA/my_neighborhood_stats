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

  def create_user_valid_credentials
    visit root_path

    click_link 'Sign Up'
    fill_in 'First name', with: 'Sherlock'
    fill_in 'Last name', with: 'Holmes'
    fill_in 'Email', with: 'sherlock@example.com'
    fill_in 'Password', with: 'e1m3taRY!#MyD3arWa2*'
    fill_in 'Password confirmation', with: 'e1m3taRY!#MyD3arWa2*'

    click_button 'Sign Up'
  end

  def create_user_invalid_credentials
    visit root_path

    click_link 'Sign Up'
    fill_in 'First name', with: nil
    fill_in 'Last name', with: nil
    fill_in 'Email', with: 'whatever'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'
  end
end
