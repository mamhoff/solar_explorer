class AddNameToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Confirmable
      t.string   :name
  	end
  	add_index :users, :name
  end
end
