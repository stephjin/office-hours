class Location
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :description, type: String

  has_many :reviews
end