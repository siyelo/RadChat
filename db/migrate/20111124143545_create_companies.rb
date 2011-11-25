class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.column :name, :string
      t.timestamps
    end
  end
end
