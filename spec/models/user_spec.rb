require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "valid user email should be enter" do
      user = User.new(email: "bristina@gmail.com", password: "password", name: "Bristina Christian")
      expect(user).to be_valid
    end
    
    it "is not valid without a Name" do
      user = User.new(name: "Bristina Christian")
      expect(user).not_to be_valid
    end

    it "is not valid withtout email" do
      user = User.new(email: "bristina@gmail.com")
      expect(user).not_to be_valid
    end

    it "has many likes" do
      association = described_class.reflect_on_association(:tasks)
      expect(association.macro).to eq :has_many
    end
  end
end

