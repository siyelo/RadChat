class UsersController < ApplicationController
  before_filter :authenticate_user!

  # TODO: move to rooms/index
  def lobby
    # @rooms = current_user.available_rooms
    @rooms = Room.all
  end
end
