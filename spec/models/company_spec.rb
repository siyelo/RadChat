require 'spec_helper'

describe Company do
  context "associations" do
    it { should have_many(:users).through(:memberships) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
