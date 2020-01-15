class Update
  include Mongoid::Document
  store_in collection: "nuovi", database:"archivi", client: "default" 

end
