class World
  include Mongoid::Document
  store_in collection: "unity", database:"archivi", client:"default"


end
