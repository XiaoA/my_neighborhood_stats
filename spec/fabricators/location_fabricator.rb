Fabricator(:location) do
  user { Fabricate(:user) }
  id 100
  address { Faker::Address.street_name }
  latitude 47.6204
  longitude 122.3491
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip_code { Faker::Address.zip_code }
end
