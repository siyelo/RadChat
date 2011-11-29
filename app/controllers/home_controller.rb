class HomeController < ApplicationController

  def index
    if current_user
      redirect_to company_url(current_user.current_company)
    else
      redirect_to new_user_session_url
    end
  end
end
