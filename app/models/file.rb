class File 
 include Mongoid::Document
  store_in collection: "apk", database:"files", client:"default" 
  # this sets up the model to accept incoming files inside files parameter.
    has_many_attached :uploads

end
