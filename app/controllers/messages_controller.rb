class MessagesController < ApplicationController
  # TODO: add filter for current user
  before_filter :load_room

  def create
    @message = { :username => current_user.username, :msg => params[:message] }

    respond_to do |format|
      format.js
    end
  end

  private
    # TODO: scope rooms by current_user
    def load_room
      @room = Room.find(params[:room_id])
    end
end
