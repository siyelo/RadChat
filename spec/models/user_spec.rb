require 'spec_helper'

describe User do

  context "associations" do
    it { should have_many(:companies).through(:memberships) }
    it { should have_many(:rooms) }
  end

  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
  end


  before(:each) do
    @attr = {
      :first_name => "pink",
      :last_name => "panther",
      :username => "pp",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :user_company => "sneakyinc"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end

  describe "company" do
    before :each do
      @user = User.create!(@attr)
    end
    it "should create a company for the user on create" do
      @user.companies.first.name.should == "sneakyinc"

      Company.count.should == 1
      Membership.count.should == 1
    end
  end

  describe "rooms" do
    before :each do
      @user = User.create!(@attr)
      @room = @user.companies.first.rooms.create!(name: "eh", title: "ehtitle",
                                          description: "ehdesc")
      ## company2
      @company2 = Company.create!(name: "room2")
      Membership.create!(user: @user, company: @company2)
      @room2 = @user.companies[1].rooms.create!(name: "room2", title: "room2title",
                                                description: "desc")
    end

    it "should allow a user to see the rooms in his company" do
      @user.available_rooms.should include @room
      @user.available_rooms.should include @room2
    end

    it "should not show rooms that are not in the other companies" do
      @user1 = User.create!({:first_name => "green",
        :last_name => "icecream",
        :username => "aapp",
        :email => "usedr@example.com",
        :password => "foobar",
        :password_confirmation => "foobar",
        :user_company => "superness"})
      @room3 = @user1.companies.first.rooms.create!(name: "meh", title: "mehtitle",
                                          description: "mehdesc")
      @user.available_rooms.should_not include @room3
      @user.available_rooms.should include @room
      @user.available_rooms.should include @room2

    end
  end

end
