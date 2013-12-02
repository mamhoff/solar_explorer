class AddIndexToCaptainsEmail < ActiveRecord::Migration
  def change
   	add_index :captains, :email, unique: true
  end
end
