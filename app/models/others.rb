class Others
  include Mongoid::Document
  store_in collection:"others",database:"db",client:"default"
end
