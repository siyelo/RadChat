class RoomsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_current_company

  def new
    @room = Room.new
  end

  def show
    @room = current_user.rooms.find(params[:id])
    @messages = @room.messages.last(10)
  end

  def create
    @room = @company.rooms.build(params[:room])
    if @room.save!
      @room.users << current_user
      flash[:notice] = "Created room."
      redirect_to company_path(@company)
    else
      flash[:error] = "Couldn't create room."
      render :new
    end
  end

  def edit
    @room = @company.rooms.find(params[:id])
  end

  def update
    @room = @company.rooms.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Room edited"
      redirect_to company_path(@company)
    else
      flash[:error] = "Couldn't create room."
      render :edit
    end
  end

  def destroy
    @room = @company.rooms.find(params[:id])
    @room.destroy
    flash[:notice] = 'Room was successfully destroyed'
    redirect_to company_path(@company)
  end

  private
    def load_current_company
      @company = current_user.current_company
    end
end
