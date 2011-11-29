class Company < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  ### Associations
  has_many :company_memberships
  has_many :users, :through => :company_memberships
  has_many :rooms

  ### Validations
  validates_uniqueness_of :name
  validates_presence_of :name
end
