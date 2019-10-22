class User
  include Mongoid::Document
    store_in collection:"user",database:"db",client:"default"
end
