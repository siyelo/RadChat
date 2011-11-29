class CompanyMembership < ActiveRecord::Base
  OWNER = 0
  ADMIN = 1
  MEMBER = 2

  belongs_to :user
  belongs_to :company

  def self.update_roles(memberships, company)
    memberships[:company_membership_ids].each do |m|
      membership = self.where(:company_id => company, :user_id => m[0]).first
      membership.update_attribute(:role, m[1])
    end
  end
end
