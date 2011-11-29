class Room < ActiveRecord::Base

  ### Validations
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :description

  ### Associations
  belongs_to :company
  has_many :messages
end
