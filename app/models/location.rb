class Location < ActiveRecord::Base
  #Your model must tell Geocoder which method returns your object's geocodable address:
  geocoded_by :my_location  # can also be an IP address
  after_validation :geocode   # auto-fetch coordinates

  #For reverse geocoding, tell Geocoder which attributes store latitude and longitude:
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  validates :address, :city, presence: true

  CITIES = ["Atlanta", "Alpharetta", "Avondale Estates", "Chamblee", "Clarkston", "College Park", "Decatur", "Doraville", "Dunwoody", "East Point", "Fairburn", "Forest Park", "Hapeville", "Lithonia", "Morrow", "Palmetto", "Riverdale", "Roswell"," Sandy Springs", "Stone Mountain", "Union City"]

  validates :city, inclusion: CITIES

  def my_location
    "#{address}, #{city}, GA"
  end #my_location

  def bus_route
    @buses.bus["ROUTE"]
  end #bus_route

end #class

# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string
#  city       :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
