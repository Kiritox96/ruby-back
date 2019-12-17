class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic  
  store_in collection:"user",database:"db",client:"default"
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 6 },
    if: -> { new_record? || !password.nil? }
                              
end
