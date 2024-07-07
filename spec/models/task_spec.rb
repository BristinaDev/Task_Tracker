require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Task' do
    it "is not valid without a Name" do
      task = Task.new(name: "My ToDo")
      expect(task).not_to be_valid
    end

    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
