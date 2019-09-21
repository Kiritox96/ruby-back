class Anime
  include Mongoid::Document
  field :name, type: String
  field :clean, type: String
  field :episodi, type: Array
  field :date, type: Date
  field :image, type: String
end
