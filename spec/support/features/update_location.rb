module Features
  def update_location
    click_on "Update Location"
    fill_in "Address", with: "101 Main St."

    click_on "Update Location"
  end
end
