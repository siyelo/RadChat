feature "User can sign up" do
  background do
    @user = {:user_first_name => "Jeffrey",
             :user_last_name => "Dahmer",
             :user_username => "jdahmer",
             :user_email => "jeffrey@dahmer.com",
             :user_password => "password",
             :user_password_confirmation => "password",
             :user_company => "Skynet"}

    reset_mailer
  end

  scenario "Sign up via register form" do
    visit('/')
    click_link("Register")
    fill_in("user_first_name", :with => @user[:user_first_name])
    fill_in("user_last_name", :with => @user[:user_last_name])
    fill_in("user_username", :with => @user[:user_username])
    fill_in("user_email", :with => @user[:user_email])
    fill_in("user_password", :with => @user[:user_email])
    fill_in("user_password_confirmation", :with => @user[:user_email])
    fill_in("user_user_company", :with => @user[:user_company])
    click_button("Sign up")
    user = User.last
    unread_emails_for(@user[:user_email]).size.should == 1
    open_email @user[:user_email], :with_subject => "Confirmation instructions"
    user.confirmed?.should be_false
    click_first_link_in_email
    user.reload.confirmed?.should be_true
  end
end
