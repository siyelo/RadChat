class UsersController < ApplicationController
  before_filter :authenticate_user!

  def people
  end

end
