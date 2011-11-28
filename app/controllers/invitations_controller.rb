class InvitationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:confirm, :create_user]

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
    @user = User.new
  end

  def create_user
    inv = Invitation.find_by_invitation_token(params[:user][:inv_token])
    user = User.new(params[:user].merge({:first_name => inv.first_name, :last_name => inv.last_name, :email => inv.email, :user_company => inv.user.current_company.name}))

    user.skip_confirmation!
    user.save(:validate => false)
    sign_in user
    redirect_to root_path
  end
end
