class Location
  include Mongoid::Document

  field :name, type: String
  field :address, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :description, type: String

  has_many :reviews
  validates_presence_of :address
end