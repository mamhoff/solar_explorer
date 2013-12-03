class AddUnconfirmedEmailToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Confirmable
      t.string   :unconfirmed_email
  	end
  	add_index :users, :confirmation_token,   :unique => true
  end
end
