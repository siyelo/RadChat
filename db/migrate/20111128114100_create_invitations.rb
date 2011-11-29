class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :message
      t.string :invitation_token
      t.boolean :accepted

      t.timestamps
    end
  end
end
