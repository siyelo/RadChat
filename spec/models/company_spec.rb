require 'spec_helper'

describe Company do

  context "Associations" do
    it { should have_many(:users).through(:company_memberships) }
    it { should have_many(:company_memberships) }
    it { should have_many(:rooms) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
  end
end
