require "rails_helper"

RSpec.describe User, type: :model do
    it "has a name" do 
        user = User.create!(name: "Nome") 
        expect(user.name).to eq("Nome") 
    end
    it "has a email" do 
        user = User.create!(email: "Email") 
        expect(user.email).to eq("Email") 
    end
    it "has a password" do 
        user = User.create!(password: "Password") 
        expect(user.password).to eq("Password") 
    end
end