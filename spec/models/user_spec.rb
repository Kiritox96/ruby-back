require "rails_helper"

RSpec.describe User, type: :model do
    it "has a name" do # yep, you can totally use 'it'
        user = User.create!(name: "Nome") # creating a new idea 'instance'
        expect(user.name).to eq("Nome") # this is our expectation
    end
    it "has a email" do # yep, you can totally use 'it'
        user = User.create!(email: "Email") # creating a new idea 'instance'
        expect(user.email).to eq("Email") # this is our expectation
    end
    it "has a password" do # yep, you can totally use 'it'
        user = User.create!(password: "Password") # creating a new idea 'instance'
        expect(user.password).to eq("Password") # this is our expectation
    end
end