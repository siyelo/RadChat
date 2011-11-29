class CreateRoomUsers < ActiveRecord::Migration
  def up
    create_table :rooms_users, :id => false do |t|
      t.integer  :room_id
      t.integer  :user_id
    end
  end

  def down
    drop_table :rooms_users
  end
end
