class Invitation < ActiveRecord::Base
  ### Associations
  belongs_to :user

  ### Validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :message

  ### Callbacks
  before_create :generate_invitation_token
  after_create :send_email_invitation

  attr_accessible :first_name, :last_name, :email, :message

  private

  def send_email_invitation
    InvitationsMailer.invitation_email(user, self).deliver
  end

  def generate_invitation_token
    self.invitation_token = rand(36**8).to_s(36)
  end
end
