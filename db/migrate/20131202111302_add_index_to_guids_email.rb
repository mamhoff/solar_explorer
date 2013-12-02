class AddIndexToGuidsEmail < ActiveRecord::Migration
  def change
   	add_index :guides, :email, unique: true
  end
end
