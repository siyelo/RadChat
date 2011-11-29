class RoomMembershipsController < ApplicationController
  before_filter :load_room

  def edit
    @users = @room.company.users
  end

  def update
    params[:room] ||= {}
    params[:room][:user_ids] ||= []
    @room.update_attribute(:user_ids, params[:room][:user_ids])
    flash[:notice] = 'Room membership was successfully updated'
    redirect_to edit_room_memberships_path
  end

  private
    def load_room
      @room = Room.find(params[:room_id])
    end
end
