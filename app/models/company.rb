class Company < ActiveRecord::Base

  ### Associations
  has_many :company_memberships
  has_many :users, :through => :company_memberships
  has_many :rooms

  ### Validations
  validates_uniqueness_of :name
  validates_presence_of :name
end
