Fabricator(:location) do
  user { Fabricate(:user) }
  id 100
  address { Faker::Address.street_name }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip_code { Faker::Address.zip_code }
end
