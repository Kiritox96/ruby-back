class Anime
  include Mongoid::Document
  store_in collection:"animes",database:"db",client:"default"
end
