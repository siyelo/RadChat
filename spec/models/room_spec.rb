require 'spec_helper'

describe Room do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe "Associations" do
    it { should belong_to(:company) }
    it { should have_many(:messages).dependent(:destroy) }
    it { should have_and_belong_to_many(:users) }
  end
end
