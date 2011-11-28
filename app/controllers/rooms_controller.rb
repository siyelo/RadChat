class RoomsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @room = Room.new
  end

  def show
    @room = Room.first
  end

  def create
    @room = current_user.rooms.build(params[:room])
    if @room.save!
      flash[:notice] = "Created room."
      redirect_to lobby_users_path
    else
      flash[:error] = "Couldn't create room."
      render :new
    end
  end

  def edit
    @room = current_user.companies.first.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Room edited"
      redirect_to lobby_users_path
    else
      flash[:error] = "Couldn't create room."
      render :edit
    end
  end
end
