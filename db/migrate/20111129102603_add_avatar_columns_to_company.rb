class AddAvatarColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :avatar_file_name,    :string
    add_column :companies, :avatar_content_type, :string
    add_column :companies, :avatar_file_size,    :integer
    add_column :companies, :avatar_updated_at,   :datetime
  end
end
