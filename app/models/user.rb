class User < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic  
  store_in collection:"user",database:"db",client:"default"
  field :name, type: String
  field :email, type: String
  field :password_digest, String

  has_secure_password                              
end
