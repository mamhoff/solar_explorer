class CreateCaptains < ActiveRecord::Migration
  def change
    create_table :captains do |t|
      t.string :name
      t.string :email
      t.string :password_token

      t.timestamps
    end
  end
end
