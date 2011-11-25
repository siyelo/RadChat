class UsersController < ApplicationController
  before_filter :authenticate_user!
  def lobby
    @rooms = current_user.available_rooms
  end
end
