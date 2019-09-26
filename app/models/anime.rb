class Anime
  include Mongoid::Document
  store_in collection:"list",database:"db",client:"default"
end
