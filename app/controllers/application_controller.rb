class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin
    unless current_user.admin?(current_user.current_company)
      flash[:notice] = 'You need to be admin to access that page'
      redirect_to root_path
    end
  end
end
