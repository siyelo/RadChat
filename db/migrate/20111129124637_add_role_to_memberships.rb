class AddRoleToMemberships < ActiveRecord::Migration
  def change
    add_column :company_memberships, :role, :integer
  end
end
