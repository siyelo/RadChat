require 'spec_helper'

describe Company do

  context "Associations" do
    it { should have_many(:users).through(:memberships) }
    it { should have_many(:memberships) }
    it { should have_many(:rooms) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
  end
end
