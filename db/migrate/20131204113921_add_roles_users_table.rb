class AddRolesUsersTable < ActiveRecord::Migration
  def change
  	drop_table :users_roles
    
    create_table :roles_users do |t|
      t.belongs_to :user
      t.belongs_to :role
    end  	
  end
end
