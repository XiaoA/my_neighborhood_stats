class Location < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :address, :city, :state, :zip_code

  geocoded_by :address
  after_validation :geocode
end
