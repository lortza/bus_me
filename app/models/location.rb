class Location < ActiveRecord::Base
  geocoded_by :my_location  # can also be an IP address
  after_validation :geocode   # auto-fetch coordinates

  validates :address, :city, presence: true

  CITIES = ["Atlanta", "Alpharetta", "Avondale Estates", "Chamblee", "Clarkston", "College Park", "Decatur", "Doraville", "Dunwoody", "East Point", "Fairburn", "Forest Park", "Hapeville", "Lithonia", "Morrow", "Palmetto", "Riverdale", "Roswell"," Sandy Springs", "Stone Mountain", "Union City"]

  validates :city, inclusion: CITIES

  def my_location
    "#{address}, #{city}, GA"
  end #my_location

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
