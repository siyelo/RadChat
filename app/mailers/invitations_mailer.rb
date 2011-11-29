class InvitationsMailer < ActionMailer::Base
  default :from => "from@example.com"

  def invitation_email(user, invitation)
    @user = user
    @invitation = invitation
    mail(:to => invitation.email,
         :subject => "You are invited to join RadChat!")
  end
end
