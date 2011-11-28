class RenameTableMembershipsToCompanyMemberships < ActiveRecord::Migration
  def up
    rename_table :memberships, :company_memberships
  end

  def down
    rename_table :company_memberships, :memberships
  end
end
