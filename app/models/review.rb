class Review
  include Mongoid::Document
  field :title, type: String
  field :body, type: String

  belongs_to :location
end