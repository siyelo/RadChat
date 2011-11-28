require 'spec_helper'

describe Message do

  context "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:room) }
  end

  describe "Validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :room_id }
    it { should validate_presence_of :message }
  end
end
