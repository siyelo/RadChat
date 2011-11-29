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
    # TODO: scope rooms by company
    # @room = current_user.current_company.rooms.find(params[:room_id])
    def load_room
      @room = Room.find(params[:room_id])
    end
end
