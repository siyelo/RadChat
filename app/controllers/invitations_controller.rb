class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @invitation = current_user.invitations.new
  end

  def create
    @invitation = current_user.invitations.new(params[:invitation])
    if @invitation.save!
      flash[:notice] = "Invitation sent."
      redirect_to root_url
    else
      flash[:error] = "Couldn't send invitation."
      render :new
    end
  end

  def confirm
    inv = Invitation.find_by_invitation_token(params[:inv_token])
    @user = User.new({:first_name => inv.first_name, :last_name => inv.last_name,
                      :email => inv.email, :user_company => inv.user.company})

    puts "userrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
    p @user
  end

  def create_user_from_invite
  end
end
