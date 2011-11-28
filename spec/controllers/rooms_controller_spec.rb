require 'spec_helper'

describe RoomsController do
  before :each do
    @attr = {:first_name => "Jeffrey",
      :last_name => "Dahmer",
      :username => "jdahmer",
      :email => "jeffrey@dahmer.com",
      :password => "password",
      :password_confirmation => "password",
      :user_company => "Skynet"}
    @user = User.create!(@attr)
    test_sign_in @user
  end

  it "redirects to the company lobby when created" do
    post :create, :room => {"name"=>"adf", "title"=>"adf", "description"=>"asdf"}
    response.should redirect_to(company_path(@user.current_company))
  end
end

