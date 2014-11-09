class Location
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  field :name, type: String
  field :address, type: String
  field :description, type: String
  field :coordinates, :type => Array
  field :latitude,  :type => Float
  field :longitude, :type => Float

  has_many :reviews
  validates_presence_of :address

  geocoded_by :address           
  reverse_geocoded_by :coordinates
  after_validation :geocode, :if => :address_changed?

end