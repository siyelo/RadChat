class Message < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :room

  # Validations
  validates_presence_of :user_id, :room_id, :message

  def self.last(length)
    order('created_at DESC').limit(length).reverse
  end
end
