class UsersController < ApplicationController
  before_filter :authenticate_user!

  # TODO: add before filter to check for admin

  def index
    @company = current_user.companies.find(params[:company_id])
    @users = @company.users.all
  end
end
