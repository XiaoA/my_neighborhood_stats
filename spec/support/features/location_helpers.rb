module Features
  def create_location
    click_on "New Location"
    fill_in "Address", with: "999 Anywhere St"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "WA"
    fill_in "Zip code", with: "98101"

    click_on "Create Location"
  end

  def update_location
    click_on "Update Location"
    fill_in "Address", with: "101 Main St."

    click_on "Update Location"
  end

  def create_invalid_location
    click_on "New Location"
    fill_in "Address", with: " "
    fill_in "City", with: " "
    fill_in "State", with: " "
    fill_in "Zip code", with: " "

    click_on "Create Location"
  end
end
