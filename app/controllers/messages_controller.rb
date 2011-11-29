class MessagesController < ApplicationController
  # TODO: add filter for current user
  before_filter :load_room

  def create
    message = Message.create!(:room => @room, :user => current_user, :message => params[:message])
    @message = { :username => current_user.username, :message => message.message }

    respond_to do |format|
      format.js
    end
  end

  private
    def load_room
      @room = current_user.rooms.find(params[:room_id])
    end
end
