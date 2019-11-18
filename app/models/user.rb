class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic  
    store_in collection:"user",database:"db",client:"default"
end
