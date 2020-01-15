class World
  include Mongoid::Document
  store_in collection: "world", database:"archivi", client:"default"


end
