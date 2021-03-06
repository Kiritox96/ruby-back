class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic  
  store_in collection:"user",database:"db",client:"default"
  #Validations
  validates_presence_of :name, :email, :password
  validates :email, uniqueness: true

  #encrypt password
  #has_secure_password                             
end
