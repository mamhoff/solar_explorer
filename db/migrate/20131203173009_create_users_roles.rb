class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
    add_index  :users_roles, :user_id
    add_index  :users_roles, :role_id
    add_index  :users_roles, [:user_id, :role_id], unique: true
  end
end
