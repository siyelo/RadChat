class AddTimezoneToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :timezone, :string
  end
end
