class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :admins, :password_token, :password_digest
  	rename_column :captains, :password_token, :password_digest
  	rename_column :guides, :password_token, :password_digest
  end
end
