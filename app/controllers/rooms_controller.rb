class RoomsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @room = Room.new
  end

  def show
    # TODO: fix this
    # @room = current_user.rooms.find(params[:id])
    @room = Room.find(params[:id])
    @messages = @room.messages.last(10)
  end

  def create
    @room = current_user.current_company.rooms.build(params[:room])
    if @room.save!
      flash[:notice] = "Created room."
      redirect_to company_path(current_user.current_company)
    else
      flash[:error] = "Couldn't create room."
      render :new
    end
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Room edited"
      redirect_to company_path(current_user.current_company)
    else
      flash[:error] = "Couldn't create room."
      render :edit
    end
  end
end
