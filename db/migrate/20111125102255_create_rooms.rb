class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :company_id

      t.timestamps
    end
  end
end
